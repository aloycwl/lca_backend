
pragma solidity>0.8.0;//SPDX-License-Identifier:None
import"https://github.com/aloycwl/ERC_AC/blob/main/ERC721AC/ERC721AC.sol";
contract ERC721_LSG is ERC721AC{
    uint public count;
    mapping(uint=>string)private _uri;
    constructor(string[] memory uri,uint[]memory num){
        for(uint i=0;i<uri.length;i++)_uri[num[i]]=uri[i];
    }
    function name()external pure override returns(string memory){
        return"Lunatic Support Group";
    }
    function symbol()external pure override returns(string memory){
        return"LSG";
    }
    function tokenURI(uint a)public view override returns(string memory){
        return string(abi.encodePacked("ipfs://",_uri[a]));
    }
    function MINT(string[] memory r)external{unchecked{
        require(r.length<6);
        require(count<3334);
        require(_balances[msg.sender]+r.length<6);
        require(block.timestamp>1654563600);
        for(uint i=0;i<r.length;i++){
            count++;
            if(bytes(_uri[count]).length<1)_uri[count]=r[i];
            _balances[msg.sender] += 1;
            _owners[count] = msg.sender;
            emit Transfer(address(0),msg.sender,count);
        }
    }}
}