
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
contract ERC721_LSG is ERC721{
    uint public count;
    mapping(uint=>string)private _uri;
    constructor(string memory _name,string memory _symbol,string[] memory uri,uint[]memory num)ERC721(_name,_symbol){
        for(uint i=0;i<uri.length;i++)_uri[num[i]]=uri[i];
    }
    function tokenURI(uint a)public view override returns(string memory){
        return string(abi.encodePacked("ipfs://",_uri[a]));
    }
    function MINT(string[] memory r)external{unchecked{
        require(r.length<6);
        require(count<3334);
        for(uint i=0;i<r.length;i++){
            count++;
            if(bytes(_uri[count]).length<1)_uri[count]=r[i];
            _mint(msg.sender,count);
        }
    }}
}