
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/aloycwl/ERC_AC/blob/main/ERC721AC/ERC721AC.sol";
contract ERC721_LSG is ERC721AC{
    uint public count;
    function name()external pure override returns(string memory){
        return"Lunatic Support Group";
    }
    function symbol()external pure override returns(string memory){
        return"LSG";
    }
    function tokenURI(uint a)external pure override returns(string memory){unchecked{
        string memory b="0";
        if(a>0){
            uint256 temp=a;
            uint256 digits;
            while(temp!=0)(digits++,temp/=10);
            bytes memory buffer=new bytes(digits);
            while(a!=0)(digits-=1,buffer[digits]=bytes1(uint8(48+uint256(a%10))),a/=10);
            b=string(buffer);
        }
        return string(abi.encodePacked("ipfs://",b));
    }}
    function MINT(uint n)external{unchecked{
        require(_balances[msg.sender]+n<6);
        require(count<3334);
        for(uint i=0;i<n;i++){
            (count++,_balances[msg.sender]+= 1,_owners[count]=msg.sender);
            emit Transfer(address(0),msg.sender,count);
        }
    }}
}