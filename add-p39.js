module.exports = (id, position, startdate) => ({
  id,
  claims: {
    P39: {
      value: position,
      qualifiers: {
        P580: '2018',
        P5054: 'Q107614223' // 2018 Cabinet
      },
      references: {
        P854: 'https://www.gov.je/Government/HowGovernmentWorks/CouncilMinisters/Pages/CouncilofMinisters.aspx',
        P1476: {
          text: 'Council of Ministers',
          language: 'en',
        },
        P813: new Date().toISOString().split('T')[0],
        P407: 'Q1860', // language: English
      }
    }
  }
})
