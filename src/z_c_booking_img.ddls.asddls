@EndUserText.label: 'Consumption - Booking'
@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
define view entity Z_C_BOOKING_IMG
  as projection on Z_I_BOOKING_IMG
{
  key Travel_Id      as travel_id,
  key Booking_Id     as booking_id,
      Booking_Date   as booking_date,
      Customer_Id    as customer_id,
      Carrier_Id     as carrier_id,
       _Carrier.Name as CarrierName,
      connection_id  as connection_id,
      flight_date    as flight_date,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price   as flightprice,
      @Semantics.currencyCode: true
      currency_code  as currencycode,
      booking_status as bookingstatus,
      last_changed_at as LastChangedAt,
      /* Associations */
      _travel            : redirected to parent Z_C_TRAVEL_IMG,
      _bookingSupplement : redirected to composition child Z_C_BOOKSUPPL_IMG,
      _Carrier,
      _Connection,
      _customer


}
