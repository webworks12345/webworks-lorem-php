<?php if( ! defined( 'ACCESS' ) ) die( 'DIRECT ACCESS NOT ALLOWED' ); 

  //$businessCode = $_POST['branchCode'];

    //$businesses = $DB->query("SELECT br.*, p.* FROM branches br
//      JOIN package p ON p.branchCode = br.branchCode
  //   WHERE br.branchCode = '$businessCode'
    //  LIMIT 1");


?>

<?= element( 'header' ) ?>

<div id="client-custom "class="client-custom" style="margin-top: 90px ">
      <div class=" container pack-head " style=" top: 50px;">
        <div class="container row">
          <a href="./details.html" class=" col-xl-1 btn-back btn-lg float-end ">
            <i class="bi bi-arrow-left"></i></a>
          <h1 class="col-xl-7 d-flex justify-content-start text-light">Check Out</h1>
         
          </div>    
       </div>       
      <div class="row d-flex p-5 g-5"> 
       
        <div id="check-out-info" class="check-out-info card col-4  px-5 py-4 " style="width: 50vw;  height:auto; margin: 50px 0 0 80px;">
          <div class="client-part mb-3">
            <h4 class=" p-3 mb-4" style=" border-bottom: 3px solid #fb7e00;"> 1. Customer Information </h4>
            <div class="row d-flex align-items-center mb-2">
                <label class="mb-2 " for="clientName">Client's Name</label>
                <input type="text" class="form-control "   name="data[cientName]" id="fname" value="<?= $business['fname'] . ' ' . $business['lname'] ?>" readonly>
            </div>
            <div class="row d-flex align-items-center mb-2">
                <label class="mb-2 " for="mobileNumber">Mobile Number</label>
                <input type="text" class="form-control " name="data[mobileNumber]" id="mobileNumber" value="<?= $business['mobileNumber'] ?>" readonly>
            </div>
            <div class="row d-flex align-items-center mb-2">
                <label class="mb-2 " for="email">Email</label>
                <input type="text" class="form-control " name="data[email]" id="email" value="<?= $business['email'] ?>" readonly>
            </div>
          </div>
          <div class="delivery mb-3">
              <h4 class=" p-3 mb-4" style=" border-bottom: 3px solid #fb7e00;"> 2. Delivery Information </h4>
              <h6> Mode of Fulfillment </h6>
              <div class="row d-flex align-items-center my-2 px-5">
                  <div class="form-check row d-flex">
                    <div class="col-5">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">Pick-up</label> <!--set na if pick-up, pick.up date lg ang accessible-->
                    </div>
                    <div class="col-5">
                       <input type="date" class="form-control"  name="data[pick-up]" id="pick-up" value="<?= $business['pick-up'] ?>" >
                    </div>
                  </div>
                  <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">Delivery</label>
                  </div>
              </div>
              <hr>
                <div class="row d-flex align-items-center mb-2"> <!-- triggered only kung delivery mode -->
                    <label class="mb-2 " for="address">Delivery Address</label>
                    <input type="text" class="form-control "   name="data[address]" id="address"  >
                </div>
                <div class="row d-flex align-items-center mb-2">
                    <label class="mb-2 " for="deliveryDate">Delivery Date</label>
                    <input type="date" class="form-control " name="data[deliveryDate]" id="deliveryDate"  >
                </div>
               
                
          </div>
          <div class="payment">
              <h4 class=" p-3 mb-4" style=" border-bottom: 3px solid #fb7e00;"> 3. Payment </h4>
              <h6> Mode of Payment </h6>
              <div class="row d-flex align-items-center my-2 px-5">
              <div class="form-check ">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">On-Site Payment</label>
                  </div>
                  <div class="form-check ">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">Online Payment</label>
                  </div>
                  <div class="form-check">
                      <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                      <label class="form-check-label" for="flexCheckDefault">Bank</label>
                  </div>
              </div>
              <hr>
                <div class="row d-flex align-items-center mb-2"> <!-- triggered only if bank ang mode-->
                    <label class="mb-2 " for="address">Card Holder's Name</label>
                    <input type="text" class="form-control "   name="data[address]" id="address" placeholder="First Name, Middle Initial, Last Name" >
                </div>
                <div class="row d-flex align-items-center mb-2">
                    <label class="mb-2 " for="deliveryDate">Card Number</label>
                    <input type="text" class="form-control " name="data[deliveryDate]" id="deliveryDate" placeholder="XXXX-XXXX-XXXX">
                </div>
               
                
          </div>
          </div>

          <div class="order-list col-4 card border-0 rounded-3 shadow p-3 mb-5 bg-white rounded" style="height: auto" >
            <h3 class="order-header sticky-top p-3">Order List</h3>
            <hr class="m-0">
            <div class=" order justify-content-center px-4 overflow-scroll">
              <hr>
              <table class="table">
                <thead>
                  <tr class="sticky-top">
                    <th scope="col">Quantity</th>
                    <th scope="col">Description</th>
                    <th scope="col">Price</th>
                  </tr>
                </thead>
                <tbody>
                    <?php //while ($row = $result->fetch_assoc()) { ?>
                        <tr>
                        <td><?php //echo $row['quantity']; ?></td>
                        <td><?php //echo $row['ServiceName']; ?></td>
                        <td><?php //echo $row['price']; ?></td>
                        </tr>
                    <?php //} ?>
                </tbody>
              </table>
              <div class="total row d-flex sticky-bottom">
                <h3 class="col-7"> Total</h3>
                <h4 class="col-5"> heeehee</h4> <!--calculation formula-->
                <div class="border-top border-bottom voucher-btn row justify-content-center align-items-center"  style="height: 60px" href="client-voucher.php">
                  <h6  class="col-10"><i class="bi bi-tags"></i>Apply Voucher</h6>
                  <i class="bi bi-chevron-right float end col-2"></i>
                </div>
                <form action="?page=check-out" method="post" >
                  <input type="hidden" name="businessCode" value="<? //$businness['cutomCode']?>">
                  <button type="submit" class="btn btn-primary" style="width:100%" data-bs-business-code="<? //$businness['cutomCode']?>">
                  Place Order
                  </button>
            </form>
              </div>
            </div>
            </div>
                    </div>
                    </div>
                    </div>
      </div>
    </div>

    <?= element( 'footer' ) ?>