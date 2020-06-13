var xhr = new XMLHttpRequest();
xhr.open('GET', 'https://cow8lutdyg.execute-api.us-east-2.amazonaws.com/dev/invoke-lambda');
xhr.onreadystatechange = function(event){
  console.log(event.target.response);
};  
console.log("will invoke rest api now ");
xhr.send(); 