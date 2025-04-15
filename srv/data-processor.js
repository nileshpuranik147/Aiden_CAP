const cds = require("@sap/cds");
const path = require("path");
const fs = require("fs");


function myfunction() {}
async function InsertInitialData() {
  // let aProjects = await SELECT.distinct .from("incidentService.Projects").columns('ID');
  // console.log(cds.root);
  // if (aProjects.length === 0) {
  //   const csv = fs.readFileSync(
  //     path.join(cds.root, "/db/data/mynsdb.Projects.csv"),
  //     "utf8"
  //   );
  //   const data = await cds.parse.csv(csv, { header: true });
  //   const [headers, ...rows] = data;

  //   const insertdata = rows.map((row) =>
  //     headers.reduce((acc, header, i) => {
  //       acc[header.trim()] = row[i]?.trim?.() ?? null;
  //       return acc;
  //     }, {})
  //   );
  //   await INSERT.into("incidentService.Projects").entries(insertdata);
  // }
}
module.exports = {
  myfunction,
  InsertInitialData,
};
