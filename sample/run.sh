#!/bin/bash
LISTENER_ORA=/u01/app/oracle/product/11.2.0/xe/network/admin/listener.ora
TNSNAMES_ORA=/u01/app/oracle/product/11.2.0/xe/network/admin/tnsnames.ora

cp "${LISTENER_ORA}.tmpl" "$LISTENER_ORA" &&
sed -i "s/%hostname%/$HOSTNAME/g" "${LISTENER_ORA}" &&
sed -i "s/%port%/1521/g" "${LISTENER_ORA}" &&
cp "${TNSNAMES_ORA}.tmpl" "$TNSNAMES_ORA" &&
sed -i "s/%hostname%/$HOSTNAME/g" "${TNSNAMES_ORA}" &&
sed -i "s/%port%/1521/g" "${TNSNAMES_ORA}" &&

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export PATH=$ORACLE_HOME/bin:$PATH
export ORACLE_SID=XE

echo "Creating sample database..."
echo "exit" | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus -S "system/oracle" @/sample/ot_drop.sql > /dev/null 2>&1
echo "exit" | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus -S "system/oracle" @/sample/ot_schema.sql > /dev/null 2>&1
echo "exit" | /u01/app/oracle/product/11.2.0/xe/bin/sqlplus -S "system/oracle" @/sample/ot_data.sql > /dev/null 2>&1
echo "...Done!"
