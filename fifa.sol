pragma solidity ^0.6.0;

contract Oracle {
    address admin;
    uint public rand;

    constructor() public {
        admin = msg.sender;
    }
    function feedRandomness(uint _rand)external{
        require(msg.sender == admin);
        rand = _rand;
    }
}
contract MyContract{
    Oracle oracle;
    uint nonce;
    constructor(addresss oracleAddress)public {
        oracle = Oracle(oracleAddress));
    }
    function foo()external{
        uint rand = _randModulus(10);
        //use rand however you want  
    }
    function _randModulus(uint mod)internal view returns(uint){
        uint rand = uint(keccak256(abi.encodePacked(
            nonce,
            oracle.rand(),
            now,
            block.difficulty,
            msg.sender)
        )) % mod;
        nonce++;
        return rand; 
    }
}