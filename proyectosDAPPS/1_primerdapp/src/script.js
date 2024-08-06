const contratoABI = [
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "nuevoTexto",
				"type": "string"
			}
		],
		"name": "almacenarTexto",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"stateMutability": "nonpayable",
		"type": "constructor"
	},
	{
		"inputs": [],
		"name": "consultarTexto",
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
		"inputs": [],
		"name": "propietario",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]

const contratoAddress = '0x9cD79d5AdcEF61C5B6598cD80727E499c302fb7e' // direccion del contrato desplegado
let contrato; // variable para almacenar la instancia del contrato

async function conectar () {
  await window.ethereum.request({ method: 'eth_requestAccounts'}); // solicitar acceso a las cuentas de metamask
  const proveedor = new ethers.providers.Web3Provider(window.ethereum); //crear un proveedor web3
  const firmante = proveedor.getSigner(); // obtiene la direccion conectada (la que firma la cuenta)
  contrato = new ethers.Contract(contratoAddress, contratoABI, firmante) //crea una instancia del contrato
  document.getElementById('accountSpan').textContent = await firmante.getAddress();
  document.getElementById('conectarBtn').textContent  = 'Conectado';
}


async function almacenar() {
  try {
    const tx = await contrato.almacenarTexto(document.getElementById('textoInput').value) //obtener el texto a almacenar
    document.getElementById('confirmacion').textContent = 'Almacenando...';
    const receipt = await tx.wait(); // esperar la confirmacion de la transaccion 
    document.getElementById('confirmacion').textContent = 'Texto almacenado';
    document.getElementById('hashTransaccsion').textContent = receipt.transactionHash;

  } catch (error) {
    document.getElementById('confirmacion').textContent = 'Error al almacenar';
  }
}

async function consultar() {
  try {
    const texto = await contrato.consultarTexto();
    document.getElementById('textoAlmacenado').textContent = "Texto: " + texto; // muestra el contenido almacenado
  } catch (error) {
    document.getElementById('textoAlmacenado').textContent = "Error al consultar ";
  }
}

document.getElementById('conectarBtn').onclick = conectar;
document.getElementById('almacenarBtn').onclick = almacenar;
document.getElementById('consultarBtn').onclick = consultar;
