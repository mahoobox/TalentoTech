// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Con esta interface hacemos esto:
// Defiminos el uso del estandar ERC20
// Definimos las reglas para la creación de tokens.
// Este estándar facilita la implementacion y manejo de tokens
// Promueve la eficiencia y compatibilidad en el ecosistema.
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// En este contrato vamos crear un token ERC20

contract TTCOINtoken is IERC20 {
    string public constant name = "ECOENERGY";
    string public constant symbol = "ECOE";
    uint8 public constant decimals = 18;
    uint256 private _totalSupply = 100000 * 10 ** uint256(decimals); // 1 millón de tokens con 18 decimales
    
    address public admin;
    uint public tokenPrice = 100; // * * * * * * * NUEVA LÍNEA * * * * * 

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    // Constructor que asigna todo el suministro inicial al creador del contrato.
    constructor() {
        admin = msg.sender; // * * * * * * * NUEVA LÍNEA * * * * * 
        _balances[address(this)] = _totalSupply / 2; // ASIGNAMOS AL CONTRATO LA MITAD DE TOKENS PARA DAR LIQUIDEZ
        _balances[msg.sender] = _totalSupply / 2 ; // ASIGNAMOS AL SENDER LA MITAD DE LOS TOKENS EMITIDOS
        emit Transfer(address(0), address(this), _balances[address(this)]); // * * * * * * * NUEVA LÍNEA * * * * * 
        emit Transfer(address(0), msg.sender, _balances[msg.sender]); // * * * * * * * MODIFICADA * * * * *  
    }

    // Funcion para obtener el total de tokens en circulacion
    function totalSupply() external view override returns (uint256) {
        return _totalSupply;
    }
    
    // Función para obtener el saldo/balance de una dirección.
    function balanceOf(address account) external view override returns (uint256) {
        return _balances[account];
    }
    
    // Función para transfierir una cantidad de tokens a una cuenta destinataria
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        require(_balances[msg.sender] >= amount, "Saldo insuficiente");
        _balances[msg.sender] -= amount;
        _balances[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
    
    // Función que le permite a una dirección gastar los tokens de otra.
    // gastarlos en su nombre
    function allowance(address owner, address spender) external view override returns (uint256) {
        return _allowances[owner][spender];
    }
    
    // Establece al cantidad de tokens que una direccion (gastador) puede gastar en nombre del propietario
    function approve(address spender, uint256 amount) external override returns (bool) {
        _allowances[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    
    // Transfiere una cantidad de tokens desde una cuenta remitente a una cuenta destinataria.
    function transferFrom(address sender, address recipient, uint256 amount) external override returns (bool) {
        require(_balances[sender] >= amount, "Saldo insuficiente");
        require(_allowances[sender][msg.sender] >= amount, "No permitido");
        
        _balances[sender] -= amount;
        _balances[recipient] += amount;
        _allowances[sender][msg.sender] -= amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    // Funcion: Establecer nuevo precio de los tokens
    // * * * * * * * NUEVA FUNCIÓN * * * * * 
    function setTokenPrice (uint newPrice) public {
        require(msg.sender == admin, "Solo el admin puede cambiar el precio");
        tokenPrice = newPrice;
    }

    // Función: Comprar tokens con ether
    // * * * * * * * NUEVA FUNCIÓN * * * * * 
    function buyEnergytokens() public payable {
        require(msg.value > 0, "Debes enviar algo de ether para comprar tokens");

        uint256 tokensToBuy = msg.value * tokenPrice;
        require(_balances[address(this)] >= tokensToBuy, "No hay suficiente tokens disponibles");

        _balances[address(this)] -= tokensToBuy;
        _balances[msg.sender] += tokensToBuy;

        emit Transfer(address(this), msg.sender, tokensToBuy);
    }

    // Function: Para que admin retire fondos del contrato
}