/
*
*
*
* @output false
* @description Staff Type Entity
* @table stafftypes
* @persistent true
* @entityname StaffType
*
*/

component {
	property name='typeID' ormtype='integer' sqltype='integer' fieldtype='id' generator='native';
	property name='typeName' ormtype='string' sqltype='varchar(45)';
	property name='typeDescription' ormtype='string' sqltype='varchar(200)';
	property name='createdOn' ormtype='timestamp' sqltype='datetime' fieldtype='timestamp';
}
