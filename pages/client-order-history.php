<?php
if (!defined('ACCESS')) die('DIRECT ACCESS NOT ALLOWED');

$clientID = $_SESSION['userID'];
$payment = $DB->query("SELECT * FROM transact WHERE clientID = '$clientID' ");

$keyword = "";
$results = [];

if (isset($_POST['keyword'])) {
    $keyword = $_POST['keyword'];
    $sql = $DB->query("SELECT * FROM transact");

    $results = $DB->query($sql);
} else {
    $results = $payment;
}
?>

<?= element('header') ?>

<?= element('client-side-nav') ?>

<div id="admin-reg" class="admin-reg">
<div class="d-flex justify-content-between p-3">
    <h1 >Order History</h1>
    
 
    <div class="mb-5 d-flex justify-content-between float-end">
        <form id="search" class="d-flex justify-content-center" method="post">
            <input type="text" class="form-control rounded" placeholder="Search" name="keyword" value="" />
            <button type="button" class="btn btn-primary" id="search-button" data-mdb-ripple-init>
                <i class="bi bi-search"></i>
            </button>
        </form>

        <!--<div id="date-picker-example" class="md-form md-outline d-flex datepicker align-items-center">
            <label for="date" class=" mx-4">Sort by Date</label>
            <input placeholder="Select date" type="date" id="date" class="form-control w-50">
        </div> -->
    </div>
    </div>
    <div style="height: 100vh;">
        <div class="table-responsive" style="height: 100vh;">
            <table class="table table-hover table-bordered" >
                <thead class="table-dark">
                    <tr>
                        <th scope="col" class="align-items-start">Transaction No.</th>
                        <th scope="col">Business Name</th>
                        <th scope="col">Package Name</th>
                        <th scope="col">Date of Transaction</th>
                        <th scope="col">Total Amount</th>
                        <th scope="col">Mode of Payment</th>
                        <th scope="col">Status</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $payment->fetch_assoc()): ?>
                        <tr>
                            <td ><?= $row['transCode'] != '' ? $row['transCode'] : 'N/A' ?></td>
                            <td><?= $row['busName']. "<br>(" . $row['branchName'] .")"?></td>
                            <td><?= $row['packName'] ?></td>
                            <td><?= $row['paymentDate'] ?></td>
                            <td><?= '₱' . number_format($row['totalAmount'], 2) ?></td>
                            <td><?= $row['paymentMethod'] ?></td>
                            <td><?= $row['status'] ?></td>
                            <td><button class="btn btn-sm btn-primary view-btn" data-toggle="modal" data-target="#itemModal<?= $row['transID'] ?>">View</button></td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modals placed outside the loop -->
<?php $payment->data_seek(0); // Reset the result set pointer ?>
<?php while ($row = $payment->fetch_assoc()): ?>
    <div class="modal fade" id="itemModal<?= $row['transID'] ?>" tabindex="-1" role="dialog" aria-labelledby="itemModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="itemModalLabel">Order Details</h5>
                    
                </div>
                <div class="modal-body">
                    <?= $row['busName']. "<br>(" . $row['branchName'] .")"?>
                    <br>
                    <?= $row['paymentDate'] ?>
                    <br>
                    <br>
                    <p>Order Details: </p>
                    <?php

                            $itemList = $row['itemList'];

                            // Check if itemList contains square brackets
                            if (strpos($itemList, '[') !== false) {
                                // Remove square brackets, quotation marks, and commas, and split the items by newline
                                $items = explode(", ", trim(str_replace(['[', ']', '"'], '', $itemList)));
                            } else {
                                // Remove commas and split the items by newline
                                $items = explode(", ", $itemList);
                            }

                            // Echo each item in a new line without commas
                            foreach ($items as $item) {
                                echo $item . "<br>";
                            }
                            ?>


                    <hr>
                            <td>Total:<?= '₱' . number_format($row['totalAmount'], 2) ?></td>
                            <br>
                            <br>

                            <?php
                                if (isset($row['pickupDate']) && !empty($row['pickupDate'])) {
                                    echo "Pick-up Date: " . $row['pickupDate'] . "<br>";
                                }

                                if (isset($row['deliveryDate']) && !empty($row['deliveryDate'])) {
                                    echo "Delivery Date: " . $row['deliveryDate'] . "<br>";
                                }

                                if (isset($row['deliveryAddress']) && !empty($row['deliveryAddress'])) {
                                    echo "Delivery Address: " . $row['deliveryAddress'] . "<br>";
                                }

                                if (isset($row['clientName']) && !empty($row['clientName'])) {
                                    echo "Purchased by: " . $row['clientName'] . "<br>";
                                }

                                if (isset($row['email']) && !empty($row['email'])) {
                                    echo "Email: " . $row['email'] . "<br>";
                                }

                                if (isset($row['mobileNumber']) && !empty($row['mobileNumber'])) {
                                    $mobileNumber = $row['mobileNumber'];
                                
                                    // Check if the mobile number starts with '9'
                                    if (substr($mobileNumber, 0, 1) === '9') {
                                        // Add a leading '0' to the mobile number
                                        $mobileNumber = '0' . $mobileNumber;
                                    }
                                
                                    echo "Mobile Number: " . $mobileNumber . "<br>";
                                }
                            ?>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
<?php endwhile; ?>

<script>
    // Data Picker Initialization
    $('.datepicker').datepicker({
        inline: true
    });
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.7/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

