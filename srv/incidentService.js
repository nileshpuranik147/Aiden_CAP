const cds = require("@sap/cds");
const dataProcessor = require("./data-processor");

module.exports = class incidentService extends cds.ApplicationService {
  async init() {
    this.before("READ", "Projects", async (Req) => {
    //   const { Incidents } = this.entities;
    //   await SELECT.from(Incidents) //("incidentService.Incidents")
    //     .then((data) => console.log(data))
    //     .catch((err) => console.error(err));
    });

    this.on("updateStatus", async (req) => {
      console.log("User Attribute : " + req.user.attr.country);
    });

    this.on("myBoundAction", async (req) => {
      debugger;
    });

    this.on("uploadData", async (req) => {
   
    });

    this.on("READ","Ext Entity", async (req) => await _get_ext_data(req));

    async function _get_ext_data(req) {
      const extSrv = await cds.connect.to('<pkg json name>');
      return await extSrv.run(req.query);
    }
    return super.init();
  }
};
