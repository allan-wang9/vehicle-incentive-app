//REQUIREMENTS & INITIALIZERS
const express = require("express");
const app = express();
const pug = require('pug');
const path = require('path');
const PORT = process.env.PORT || 3000;

//DATABASE INITIALIZERS
const sqlite3 = require('sqlite3').verbose()
let db = new sqlite3.Database('data/incentive.db')

//MIDDLEWARE 
app.use(express.static('public'));
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.set(path.join(__dirname, 'views'));

//GLOBAL VARIABLES 
const validProvinces = ["Alberta", "British Columbia", "Manitoba", 
"New Brunswick", "Newfoundland and Labrador", "Nova Scotia", "Ontario", 
"Prince Edward Island", "Quebec", "Saskatchewan"]

//SERVER ROUTES -> handles all CRUD (create/read/update/delete) operations

// ------------------------------------------------------------------------
// GET -> home page  
app.get(['/', '/home'], getHome);

//Get the home page (GET for /, /home)
function getHome(request, response){
    response.format({
        "text/html": () => {
            logRequest(request);
            response.set("Content-Type", "text/html");
            response.send(pug.renderFile("./views/home.pug"));
        },
        "default" : () => {response.status(404).send("Cannot get home page.");}
    });
}

// ------------------------------------------------------------------------
// GET -> learn more page 
app.get('/learnMore', getLearnMore);

//Get the learn more page (GET for /learnMore)
function getLearnMore(request, response){
    response.format({
        "text/html": () => {
            logRequest(request);
            response.set("Content-Type", "text/html");
            response.send(pug.renderFile("./views/learn.pug"));
        },
        "default" : () => {response.status(404).send("Cannot get learn more page.");}
    });
}

// ------------------------------------------------------------------------
// POST -> validate selected province 
app.post('/validate', validate);

// Post to validate the province from global in-memory list of provinces
function validate(request, response){
    logRequest(request);

    //Print the request body
    console.log("Server accepting JSON request/body:");
    const body = request.body;
    console.log(body);
    const province = body["province"];

    //Create object to send back as response (used to extract province for URL redirect)
    let provinceObj = {};
    provinceObj["Province"] = province;

    //Validate province
    if (validProvinces.includes(province)){
        response.status(200).send(provinceObj);
    } else {
        response.status(404).send("Cannot validate province.");
    }
}

// ------------------------------------------------------------------------
// GET -> gets models page 
app.get('/models/:province', getModels);

// Get models based on the selected province 
function getModels(request, response){
    response.format({
        "text/html": () => {
            logRequest(request);

            // make 2 objects -> list of models, province
            let listOfModelsObj = {};
            let provinceObj = {};

            //parse the request to extract selected province 
            const province = request.params.province;
            provinceObj["selectedProvince"] = province;

            //query db by selected province and populate JSON, listOfModelsObj
            db.all(
            `SELECT Model.Model_ID, Brand, Model_Name 
            FROM PurchasedIn 
            INNER JOIN Model 
            ON PurchasedIn.Model_ID = Model.Model_ID 
            WHERE Province = '${province}'`, 
            function (err, rows){
                rows.forEach(function(row){
                    console.log("Showing models:")
                    console.log(row.Model_ID, row.Brand, row.Model_Name);
                    listOfModelsObj[row.Model_ID] = {"model_id" : row.Model_ID, "brand" : row.Brand, "model_name" : row.Model_Name}
                });
                console.log(listOfModelsObj);

                //send response to get /views/models.pug
                response.set("Content-Type", "text/html");
                response.send(pug.renderFile("./views/models.pug", {pugListOfModels: listOfModelsObj, pugSelectedProvince: provinceObj}));
            });
        },
        "default" : () => {response.status(404).send("Cannot get models page by province.");}
    });
}

// ------------------------------------------------------------------------
// GET -> gets model page (for individual models) by province  

app.get('/models/:province/:modelID', getModel);

// Get model by ID
function getModel(request, response){
    response.format({
        "text/html": () => {
            logRequest(request);

            // make object -> details of model
            let modelInfoObj = {};

            //parse the request to extract Model ID 
            const ID = request.params.modelID;

            //query db by selected province and populate JSON, listOfModelsObj
            db.all(
            `SELECT Model.Model_ID, Brand, Model_Name, Range, Acceleration, Price, Type, Province, Incentive_Value 
            FROM Model
            INNER JOIN Incentive
            ON Model.Model_ID = Incentive.Model_ID
            WHERE Model.Model_ID = ${ID};`, 
            function (err, rows){
                rows.forEach(function(row){
                    console.log("Showing model details:")
                    console.log(row.Model_ID, row.Brand, row.Model_Name, row.Range, row.Acceleration, row.Price, row.Type, row.Province, row.Incentive_Value);
                    modelInfoObj["Model_ID"] = row.Model_ID;
                    modelInfoObj["Brand"] = row.Brand;
                    modelInfoObj["Model_Name"] = row.Model_Name;
                    modelInfoObj["Range"] = row.Range;
                    modelInfoObj["Acceleration"] = row.Acceleration;
                    modelInfoObj["Price"] = row.Price;
                    modelInfoObj["Type"] = row.Type;
                    modelInfoObj["Province"] = row.Province;
                    modelInfoObj["Incentive_Value"] = row.Incentive_Value;
                });

                //query db by selected brand for country of origin 
                db.all(
                    `SELECT Country FROM Model
                    INNER JOIN Manufacturer
                    ON Model.Brand = Manufacturer.Brand
                    WHERE Model.Model_ID = ${ID};`, 
                    function (err, rows){
                        rows.forEach(function(row){
                            modelInfoObj["Country"] = row.Country;
                        });
                    //send response to get /views/model.pug
                    console.log(modelInfoObj);
                    response.set("Content-Type", "text/html");
                    response.send(pug.renderFile("./views/model.pug", {pugModelInfo: modelInfoObj}));
                });
            });
        },
        "default" : () => {response.status(404).send("Cannot get model page by province.");}
    });
}

//Helper Function -> console log the received request
function logRequest(request){
    console.log(`${request.method} -> ${request.url}`);
}

//CONNECT TO DATABASE
app.listen(PORT);
	console.log(`Server listening at http://localhost:${PORT}`);