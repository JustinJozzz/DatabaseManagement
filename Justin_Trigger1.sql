#Automatically updates the machine’s next service date to be 180 days from the last “Routine Checkup”.
DROP TRIGGER IF EXISTS upd_next_service_dt;
delimiter //
CREATE TRIGGER upd_next_service_dt AFTER INSERT ON services
FOR EACH ROW
BEGIN
	IF NEW.SERVICE_TYPE = 'ROUTINE CHECKUP' THEN
		UPDATE MACHINES SET MACHINE_NEXT_SERVICE_DATE = DATE_ADD(Now(), Interval 180 day) 
			WHERE MACHINE_ID = NEW.SERVICE_MACHINE_ID;
	END IF;
END;//
delimiter ;