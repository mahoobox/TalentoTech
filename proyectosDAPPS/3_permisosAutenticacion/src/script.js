const contractAddress = "0xCd550Bf63027F4e7206D779Fb9A2B6B751fe88a8"; // Dirección del contrato en Sepolia
const abi = [
    {
        "inputs": [],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [],
        "name": "administrador",
        "outputs": [
            {
                "internalType": "address",
                "name": "",
                "type": "address"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_usuario",
                "type": "address"
            }
        ],
        "name": "eliminuarUsuario",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_usuario",
                "type": "address"
            }
        ],
        "name": "estaUsuarioRegistrado",
        "outputs": [
            {
                "internalType": "bool",
                "name": "",
                "type": "bool"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_usuario",
                "type": "address"
            }
        ],
        "name": "obtenerNombreRegistrado",
        "outputs": [
            {
                "internalType": "string",
                "name": "",
                "type": "string"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_usuario",
                "type": "address"
            },
            {
                "internalType": "string",
                "name": "_nombre",
                "type": "string"
            }
        ],
        "name": "registrarUsuario",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    }
]; // ABI del contrato

const connectButton = document.getElementById("connectButton");
const userActions = document.getElementById("userActions");
const registerButton = document.getElementById("registerButton");
const registerUser = document.getElementById("registerUser");
const registerName = document.getElementById("registerName");
const checkButton = document.getElementById("checkButton");
const checkUser = document.getElementById("checkUser");
const checkResult = document.getElementById("checkResult");
const deleteButton = document.getElementById("deleteButton");
const deleteUser = document.getElementById("deleteUser");

let provider;
let signer;
let contract;

// Conecta con Metamask
connectButton.addEventListener("click", async () => {
    if (window.ethereum) {
        provider = new ethers.providers.Web3Provider(window.ethereum);
        await provider.send("eth_requestAccounts", []);
        signer = provider.getSigner();
        contract = new ethers.Contract(contractAddress, abi, signer);

        // Mostrar opciones de usuario
        connectButton.style.display = "none";
        userActions.style.display = "block";
        console.log("Conectado a Metamask");
    } else {
        alert("Metamask no está instalado.");
    }
});

// Registrar usuario
registerButton.addEventListener("click", async () => {
    try {
        await contract.registrarUsuario(registerUser.value, registerName.value);
        alert("Usuario registrado correctamente.");
    } catch (error) {
        console.error("Error al registrar usuario:", error);
        alert("Error al registrar usuario.");
    }
});

// Comprobar usuario
checkButton.addEventListener("click", async () => {
    try {
        const isRegistered = await contract.estaUsuarioRegistrado(checkUser.value);
        if (isRegistered) {
            const nombre = await contract.obtenerNombreRegistrado(checkUser.value);
            checkResult.innerText = `Usuario registrado: ${nombre}`;
        } else {
            checkResult.innerText = "Usuario no registrado.";
        }
    } catch (error) {
        console.error("Error al comprobar usuario:", error);
        alert("Error al comprobar usuario.");
    }
});

// Eliminar usuario
deleteButton.addEventListener("click", async () => {
    try {
        await contract.eliminuarUsuario(deleteUser.value);
        alert("Usuario eliminado correctamente.");
    } catch (error) {
        console.error("Error al eliminar usuario:", error);
        alert("Error al eliminar usuario.");
    }
});