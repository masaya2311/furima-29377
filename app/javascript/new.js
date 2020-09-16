function calculation(){

  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  price.addEventListener('input', function() {   
    const text = document.getElementById("item-price").value
    tax.innerHTML = Math.ceil(text * 0.1)
    profit.innerHTML = Math.floor(text * 0.9)
  })  
}

window.addEventListener('load', calculation )
 