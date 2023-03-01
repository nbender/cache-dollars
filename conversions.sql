-- https://stackoverflow.com/questions/2082686/how-do-i-cast-a-string-to-integer-and-have-0-in-case-of-error-in-the-cast-with-p

CREATE OR REPLACE FUNCTION convert_to_integer(v_input text)
RETURNS INTEGER AS $$
DECLARE v_value INTEGER DEFAULT NULL;
BEGIN
    BEGIN
        v_value := v_input::INTEGER;
    EXCEPTION WHEN OTHERS THEN
        RETURN NULL;
    END;
RETURN v_value;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION convert_to_decimal(v_input text)
RETURNS DECIMAL AS $$
DECLARE v_value DECIMAL DEFAULT NULL;
BEGIN
    BEGIN
        v_value := v_input::DECIMAL;
    EXCEPTION WHEN OTHERS THEN
        RETURN NULL;
    END;
RETURN v_value;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION convert_to_date(v_input text)
RETURNS DATE AS $$
DECLARE v_value DATE DEFAULT NULL;
BEGIN
    BEGIN
        v_value := v_input::DATE;
    EXCEPTION WHEN OTHERS THEN
        RETURN NULL;
    END;
RETURN v_value;
END;
$$ LANGUAGE plpgsql;
