describe('Basic Kiali', function() {
    it('Check kiali page is accessible', function() {
      cy.visit(Cypress.env('kiali_url'))
      cy.title().should('eq', 'Kiali Console')
     
    })
     
}) 