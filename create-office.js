// wd create-entity create-office.js "Minister for X"
module.exports = (label) => {
  return {
    type: 'item',
    labels: {
      en: label,
    },
    descriptions: {
      en: 'position in the Council of Ministers of Jersey',
    },
    claims: {
      P31:   { value: 'Q294414' }, // instance of: public office
      P279:  { value: 'Q83307'  }, // subclas of: minister
      P1001: { value: 'Q785'    }, // jurisdiction: New Zealand
      P361: {
        value: 'Q5060027',         // part of: Council of Ministers of Jersey
        references: {
          P854: 'https://www.gov.je/Government/HowGovernmentWorks/CouncilMinisters/Pages/CouncilofMinisters.aspx',
        },
      }
    }
  }
}
