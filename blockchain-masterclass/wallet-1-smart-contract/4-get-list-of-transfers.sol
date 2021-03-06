pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Wallet {
  address[] public approvers;
  uint public quorum;
  struct Transfer {
    uint id;
    uint amount;
    address payable to;
    uint approvals;
    bool sent;
  }
  mapping(uint => Transfer) public transfers;

  constructor(address[] memory _approvers, uint _quorum) public {
    approvers = _approvers;
    quorum = _quorum;
  }

  function getApprovers() external view returns(address[] memory) {
    return approvers;
  }

  function getTransfers() external view returns(Transfer[] memory) {
    return transfers;
  }

  function createTransfer(uint amount, address payable to) external {
    transfers.push(Transfer(
      transfers.length,
      amount,
      to,
      0,
      false
    );
  }
}
