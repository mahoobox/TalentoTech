const contractAddress = "0x4Eb3566AE3a0eE13bCc5ca04Adf845b6af82a9C1"; // Dirección del contrato en Sepolia
const abi = [
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_direccionGestorUsuarios",
                "type": "address"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "constructor"
    },
    {
        "inputs": [],
        "name": "obtenerRegistros",
        "outputs": [
            {
                "internalType": "string[]",
                "name": "",
                "type": "string[]"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "string",
                "name": "_dato",
                "type": "string"
            }
        ],
        "name": "registrarDato",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    }
]; // ABI del contrato

const connectButton = document.getElementById("connectButton");
const dataActions = document.getElementById("dataActions");
const registerButton = document.getElementById("registerButton");
const registerData = document.getElementById("registerData");
const getRecordsButton = document.getElementById("getRecordsButton");
const recordsList = document.getElementById("recordsList");

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

        // Mostrar opciones de datos
        connectButton.style.display = "none";
        dataActions.style.display = "block";
        console.log("Conectado a Metamask");
    } else {
        alert("Metamask no está instalado.");
    }
});

// Registrar dato
registerButton.addEventListener("click", async () => {
    try {
        await contract.registrarDato(registerData.value);
        alert("Dato registrado correctamente.");
    } catch (error) {
        console.error("Error al registrar dato:", error);
        alert("Error al registrar dato.");
    }
});

// Obtener registros
getRecordsButton.addEventListener("click", async () => {
    try {
        const registros = await contract.obtenerRegistros();
        recordsList.innerHTML = "";
        for (let i = 0; i < registros.length; i++) {
            const listItem = document.createElement("li");
            listItem.innerText = registros[i];
            recordsList.appendChild(listItem);
        }
    } catch (error) {
        console.error("Error al obtener registros:", error);
        alert("Error al obtener registros.");
    }
});