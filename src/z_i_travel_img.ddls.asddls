@AbapCatalog.sqlViewName: 'ZV_TRAV_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Travel'
define root view Z_I_TRAVEL_IMG
  as select from ztb_travel_img as Travel
  composition [0..*] of Z_I_BOOKING_IMG as _Booking
  association [0..1] to /DMO/I_Agency   as _agency   on $projection.agency_id = _agency.AgencyID
  association [0..1] to /DMO/I_Customer as _Customer on $projection.customer_id = _Customer.CustomerID
  association [0..1] to I_Currency      as _Currency on $projection.currency_code = _Currency.Currency
{

  key travel_id       as travel_id,
      agency_id       as agency_id,
      customer_id     as customer_id,
      begin_date      as begin_date,
      end_date        as end_date,
      @Semantics.amount.currencyCode: 'currency_code'
      booking_fee     as booking_fee,
      @Semantics.amount.currencyCode: 'currency_code'
      total_price     as total_price,
      @Semantics.currencyCode: true
      currency_code   as currency_code,
      description     as description,
      overall_status  as overall_status,
      @Semantics.user.createdBy: true
      created_by      as created_by,
      @Semantics.systemDateTime.createdAt: true
      created_at      as created_at,
      @Semantics.user.lastChangedBy: true
      last_changed_by as last_changed_by,
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at as last_changed_at,
      _Booking,
      _agency,
      _Customer,
      _Currency

}
