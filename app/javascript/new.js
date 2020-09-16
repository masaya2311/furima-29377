window.addEventListener('load', function(){

  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")
  
  price.addEventListener('input', function() {
    console.log("hoge")
    const text = document.getElementById("item-price").value
    console.log(text)
    tax.innerHTML = Math.ceil(text * 0.1)
    profit.innerHTML = Math.floor(text * 0.9)
  })  
})

 