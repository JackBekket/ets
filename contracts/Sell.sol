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
    uint public fundingGoal; uint public amountRaised; uint public deadline; uint public price;
    token public tokenReward;
    mapping(address => uint256) public balanceOf;
    bool fundingGoalReached = false;
    event GoalReached(address beneficiary, uint amountRaised);
    event FundTransfer(address backer, uint amount, bool isContribution);
    bool crowdsaleClosed = false;


/* Initialization */
function Sell(

          address ifSuccessfulSendTo,
          uint fundingGoalInEthers,
          uint durationInMinutes,
          uint etherCostOfEachToken,
          token addressOfTokenUsedAsReward
      ) {
          beneficiary = ifSuccessfulSendTo;
          fundingGoal = fundingGoalInEthers * 1 ether;
          deadline = now + durationInMinutes * 1 minutes;
          price = etherCostOfEachToken * 1 ether;
          tokenReward = token(addressOfTokenUsedAsReward);
      }

  )




}
