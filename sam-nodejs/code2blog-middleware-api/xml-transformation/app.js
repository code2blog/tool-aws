// const axios = require('axios')
// const url = 'http://checkip.amazonaws.com/';
let response;

exports.lambdaHandler = async (event, context) => {
    try {
        response = {
            'statusCode': 200,
            'body': {}
        };
        
        let fs = require('fs');
        let xmlContents = fs.readFileSync('input.xml', 'utf-8');
        let DOMParser = require('xmldom').DOMParser;
        let parser = new DOMParser();
        let xmlDOM = parser.parseFromString(xmlContents, 'text/xml')
        let books = xmlDOM.getElementsByTagName('book');
        response.body = {};
        response.body.books = [];
        Array.prototype.slice.call(books).forEach( bookXmlNode => {
            let book = {};
            book.author = textContent(bookXmlNode, 'author');
            book.title = textContent(bookXmlNode, 'title');
            book.genre = textContent(bookXmlNode, 'genre');
            book.price = textContent(bookXmlNode, 'price');
            book.publish_date = textContent(bookXmlNode, 'publish_date');
            book.description = textContent(bookXmlNode, 'description');
            response.body.books.push(book);
        });

    } catch (err) {
        console.log(err);
        return err;
    }

    return response
};

function textContent(element, tagName){
    let elementsFound = element.getElementsByTagName(tagName);
    return Array.prototype.slice.call(elementsFound)[0].textContent;
}
