/
*
*
*
* @output false
* @description User Entity
* @table users
* @persistent true
* @entityname User
*
*/

component {
	property name='userID' ormtype='integer' sqltype='integer' fieldtype='id' generator='native';
	property name='firstName' ormtype='string' sqltype='varchar(100)';
	property name='lastName' ormtype='string' sqltype='varchar(100)';
	property name='userName' ormtype='string' sqltype='varchar(100)';
	property name='email' ormtype='string' sqltype='varchar(150)';
	property name='password' ormtype='string' sqltype='varchar(200)';
	property name='isDH' ormtype='boolean' sqltype='bit' default=0;
	property name='badgeNum' ormtype='integer' sqltype='integer' notnull=false;
  property name='bio' ormtype='string' sqltype='varchar(5000)' notnull=false;
  property name='application' ormtype='string' sqltype='varchar(5000)' notnull=false;
  property name='isActive' ormtype='boolean' sqltype='bit' default=1;

  property name='userType' cfc='UserType' fieldtype='many-to-one' fkcolumn='userTypeID';
  property name='staffType' cfc='StaffType' fieldtype='many-to-one' fkcolumn='staffTypeID';
}
