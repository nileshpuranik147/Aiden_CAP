const cds = require('@sap/cds');
module.exports = cds.server; // fallback if run via `cds run`

cds.on('bootstrap', async (app) => {
   // await cds.connect.to('db');
  //  let result = await SELECT.from('incidentService.Incidents');

  console.log('📦 CSV data loaded from db/data');
});

cds.on('served', () => {
  console.log('✅ Services are up and running!');
});

// const cds = require('@sap/cds');

// // const { Projects, Incidents } = cds.entities;
// cds.on('bootstrap', async () => {
//     // const { Incidents } = cds.entities;
//     let result = await SELECT.from('incidentService.Incidents');
//     console.log(result);    
//  // const db = await cds.connect.to('db');
// //   if (cds.env.requires.db.kind === 'sqlite') {
// //     console.log('🚀 Bootstrapping SQLite with CSV data...');
    
// //     const csvFolder = path.join(__dirname, '../db', 'data');
// //     const files = fs.readdirSync(csvFolder).filter(f => f.endsWith('.csv'));

// //     for (const file of files) {
// //       const entityName = file.replace('.csv', '');
// //       const csvPath = path.join(csvFolder, file);
// //       const csv = fs.readFileSync(csvPath, 'utf8');
// //       const data = cds.parse.csv(csv);

// //       try {
// //         await INSERT.into(entityName).entries(data);
// //         console.log(`✅ Loaded data into ${entityName}`);
// //       } catch (err) {
// //         console.warn(`⚠️  Could not insert into ${entityName}:`, err.message);
// //       }
// //     }
// //   }
// });