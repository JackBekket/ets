contract owned {
    address public owner;

    function owned() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        if (msg.sender != owner) throw;
        _
    }

    function transferOwnership(address newOwner) onlyOwner {
        owner = newOwner;
    }
}

contract token { function transfer(address receiver, uint amount){  } }


contract Sell is owned {

/*contract variable */
address public beneficiary;
    uint public fundingGoal;
    uint public amountRaised;
//    uint public deadline;
    uint public price;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool fundingGoalReached = false;
    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);
    event Collected(address beneficiary, uint amountRaised);
    bool crowdsaleClosed = false;
//uint amountToPay;
//uint amountAll;

    uint256 public sellPrice;
/* Initialization */
function Sell(

          address ifSuccessfulSendTo,
  //        uint fundingGoalInEthers,
  //        uint durationInMinutes,
          uint etherCostOfEachToken,
          token addressOfTokenUsedAsReward
      ) {
          beneficiary = ifSuccessfulSendTo;
    //      fundingGoal = fundingGoalInEthers * 1 ether;
    //      deadline = now + durationInMinutes * 1 minutes;
          price = etherCostOfEachToken * 1 ether;
          tokenReward = token(addressOfTokenUsedAsReward);
      }



  /* The function without name is the default function that is called whenever anyone sends funds to a contract */
   function () {
       if (crowdsaleClosed) throw;
       uint amount = msg.value;
       balanceOf[msg.sender] = amount;
       amountRaised += amount;
       tokenReward.transfer(msg.sender, amount / price);
       FundTransfer(msg.sender, amount, true);
   }

   function safeWithdrawal() {


          if (beneficiary == msg.sender) {
      //      amountToPay=amountRaised;
              if (beneficiary.send(amountRaised)) {

                  FundTransfer(beneficiary, amountRaised, false);
                //  amountAll=amountAll+amountToPay
              //    amountToPay=0;
              Collected(beneficiary,amountRaised);
                  amountRaised=0;
              } else {
                  //If we fail to send the funds to beneficiary, unlock funders balance
                //  fundingGoalReached = false;
              }
          }
      }



 function closeCrowdsale(){
   if (beneficiary==msg.sender) {

     crowdsaleClosed=true;

   }
 }

function setPrice(uint256 newSellPrice){
price=newSellPrice;

}



}
