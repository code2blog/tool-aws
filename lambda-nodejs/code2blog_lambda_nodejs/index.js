
console.log("loading function code2blog_lambda_nodejs");  

exports.handler = async (event) => {
    console.log(event)
    return 'hello code2blog viewers';
};
