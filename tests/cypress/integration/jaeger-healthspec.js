describe('Basic Jaeger', function() {
    it('Check Jaeger page is accessible', function() {
      cy.visit(Cypress.env('jaeger_url'))
      cy.title().should('eq', 'Jaeger UI')
     
    })
     
}) 