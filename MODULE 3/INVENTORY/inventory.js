let inventory = [];
function addProduct() {
    const name = document.getElementById('name').value;
    const price = document.getElementById('price').value;
    const quantity = document.getElementById('quantity').value;

    if (name && price && quantity) {
        const product = {
            name: name,
            price: parseFloat(price).toFixed(2),
            quantity: parseInt(quantity)
        };
        
        inventory.push(product);
        displayInventory();
        
        document.getElementById('name').value = '';
        document.getElementById('price').value = '';
        document.getElementById('quantity').value = '';
    } else {
        alert('Please fill in all fields');
    }
}

function displayInventory() {
    const inventoryList = document.getElementById('inventoryList');
    inventoryList.innerHTML = '';

    inventory.forEach((product, index) => {
        const row = `
            <tr>
                <td>${product.name}</td>
                <td>$${product.price}</td>
                <td>${product.quantity}</td>
            </tr>
        `;
        inventoryList.innerHTML += row;
    });
}