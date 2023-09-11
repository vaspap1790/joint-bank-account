pragma solidity >=0.4.22 <=0.8.19;

contract BankAccount {

    event Deposit(
        address indexed user,
        uint indexed accountId, 
        uint value, 
        uint timestamp
    );    

    event Withdraw(
        address indexed withdrawId,
        uint timestamp
    );

    event WithdrawRequested(
        address indexed user, 
        uint indexed accountId, 
        uint indexed withdrawId, 
        uint value, 
        uint timestamp
    );

    event AccountCreated(
        address[] indexed owners,
        uint indexed id,
        uint timestamp
    );

    struct WithdrawRequest {
        address user;
        uint amount;
        uint approvals;
        mapping(address => bool) ownersApproved;
        bool approved;
    }

    struct Account {
        address[] owners;
        uint balance;
        mapping(uint => WithdrawRequest) withdrawRequests;
    }

    mapping(uint => Account) accounts;
    mapping(address => uint[]) userAccounts;

    uint nextAccountId;
    uint nextWithdrawId;
}
