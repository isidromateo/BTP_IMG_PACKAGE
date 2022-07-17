@AbapCatalog.sqlViewName: 'ZV_BOOK_IMG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Interface - Booking'
define view Z_I_BOOKING_IMG
  as select from ztb_booking_img as booking
  composition [0..*] of Z_I_BOOKSUPPL_IMG as _bookingSupplement
  association        to parent Z_I_TRAVEL_IMG    as _travel on $projection.Travel_Id     = _travel.travel_id
  association [1..1] to /DMO/I_Customer   as _customer      on $projection.Customer_Id   = _customer.CustomerID
  association [1..1] to /DMO/I_Carrier    as _Carrier       on $projection.Carrier_Id    = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection as _Connection    on $projection.connection_id = _Connection.ConnectionID
{
  key travel_id       as Travel_Id,
  key booking_id      as Booking_Id,
      booking_date    as Booking_Date,
      customer_id     as Customer_Id,
      carrier_id      as Carrier_Id,
      connection_id   as connection_id ,
      flight_date     as flight_date,
      @Semantics.amount.currencyCode: 'Currency_Code'
      flight_price    as flight_price,
      @Semantics.currencyCode: true
      currency_code   as currency_code ,
      booking_status  as booking_status ,
      last_changed_at as last_changed_at,
      _travel,
      _bookingSupplement,
      _customer,
      _Carrier,
      _Connection
}
