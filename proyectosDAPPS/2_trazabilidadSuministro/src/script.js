// Dirección del contrato inteligente
const contractAddress = '0xbF9B2c3928Ca46ebCC937F5a9E688Abd4eD2338e';

// ABI del contrato
const abi = [
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_idProducto",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_ubicacion",
				"type": "string"
			}
		],
		"name": "actualizarEstado",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_nombre",
				"type": "string"
			}
		],
		"name": "registrarProducto",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "contadorProductos",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_idProducto",
				"type": "uint256"
			}
		],
		"name": "obtenerHistorial",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "ubicacion",
						"type": "string"
					},
					{
						"internalType": "uint256",
						"name": "marcaTiempo",
						"type": "uint256"
					}
				],
				"internalType": "struct TrazabilidadSimple.Estado[]",
				"name": "",
				"type": "tuple[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "obtenerListaProductos",
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
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "productos",
		"outputs": [
			{
				"internalType": "string",
				"name": "nombre",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];

// Función para conectar la billetera
async function connectWallet() {
  if (window.ethereum) {
    try {
      const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
      const account = accounts[0];

      document.getElementById('wallet-address').innerText = account;
      document.getElementById('connect-wallet').classList.add('hidden');
      document.getElementById('wallet-info').classList.remove('hidden');
      document.getElementById('contract-interaction').classList.remove('hidden');

      // Conectar con el contrato
      const provider = new ethers.providers.Web3Provider(window.ethereum);
      const signer = provider.getSigner();
      const contract = new ethers.Contract(contractAddress, abi, signer);
      
      // Ejemplos de interacción con el contrato:
      // - Registrar un producto
      document.getElementById('registrar-producto-button').addEventListener('click', async () => {
        const nombreProducto = document.getElementById('registrar-producto').value;
        try {
          await contract.registrarProducto(nombreProducto);
          console.log('Producto registrado correctamente.');
        } catch (error) {
          console.error('Error al registrar el producto:', error);
        }
      });

      // - Actualizar estado de un producto
      document.getElementById('actualizar-estado-button').addEventListener('click', async () => {
        const idProducto = document.getElementById('actualizar-estado-id').value;
        const ubicacion = document.getElementById('actualizar-estado-ubicacion').value;
        try {
          await contract.actualizarEstado(idProducto, ubicacion);
          console.log('Estado actualizado correctamente.');
        } catch (error) {
          console.error('Error al actualizar el estado:', error);
        }
      });

      // - Obtener historial de un producto
document.getElementById('obtener-historial-button').addEventListener('click', async () => {
  const idProducto = document.getElementById('obtener-historial-id').value;
  try {
    const historial = await contract.obtenerHistorial(idProducto);

    // Formatea la marca de tiempo
    const formattedHistorial = historial.map(estado => {
      const timestamp = parseInt(estado.marcaTiempo.toString(), 16); // Convierte de hex a decimal
      const date = new Date(timestamp * 1000); // Convierte a segundos y crea objeto Date
      const formattedDate = date.toLocaleString(); // Formatea la fecha y hora

      return [estado.ubicacion, formattedDate];
    });

    document.getElementById('historial-resultado').innerText = JSON.stringify(formattedHistorial);
  } catch (error) {
    console.error('Error al obtener el historial:', error);
  }
});


      // - Obtener lista de productos
      document.getElementById('obtener-lista-button').addEventListener('click', async () => {
        try {
          const listaProductos = await contract.obtenerListaProductos();
          document.getElementById('lista-productos').innerText = JSON.stringify(listaProductos);
        } catch (error) {
          console.error('Error al obtener la lista de productos:', error);
        }
      });

    } catch (error) {
      console.error('Error al conectar la billetera:', error);
    }
  } else {
    alert('Por favor, instala MetaMask.');
  }
}

// Event listener para conectar la billetera
document.getElementById('connect-wallet').addEventListener('click', connectWallet);