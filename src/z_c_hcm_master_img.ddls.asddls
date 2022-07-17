@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'HCM - IMG Master'
@Metadata.allowExtensions: true
define root view entity Z_C_HCM_MASTER_IMG
  as projection on Z_I_HCM_MASTER_IMG
{
      @ObjectModel.text.element: ['Employeenumber']
  key ENumber      as Employeenumber,
      EName        as EmployeeName,
      EDepartment  as EmployeeDepartment,
      Status       as EmployeeStatus,
      JobTitle     as JobTitle,
      StartDate    as StartDate,
      EndDate      as EndDate,
      Email        as Email,
      @ObjectModel.text.element: ['Employeename']
      MNumber      as ManagerNumber,
      MName        as ManagerName,
      MDepartament as ManagerDepartament,
      CreaDateTime as CreateOn,
      CreaUname    as CreateBy,
      LchgDateTime as ChangeON,
      LchgUname    as Changedby
}
