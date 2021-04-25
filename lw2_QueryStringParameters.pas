PROGRAM WorkWithQueryString(INPUT, OUTPUT);
USES
  DOS;

FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  QueryString, ParameterString: STRING;
  KeyStart, ParameterEnd, ParameterStart: INTEGER;
BEGIN
  QueryString := GetEnv ('QUERY_STRING');
  KeyStart := POS(Key, QueryString);
  IF KeyStart = 0
  THEN
    GetQueryStringParameter := 'There is no ' + key
  ELSE
    BEGIN
      ParameterStart := KeyStart + LENGTH(Key) + 1;
      ParameterString := COPY(QueryString, ParameterStart, LENGTH(QueryString));
      ParameterEnd := POS('&', ParameterString);
      IF ParameterEnd = 0
      THEN
        ParameterEnd := LENGTH(ParameterString)
      ELSE
        ParameterEnd := ParameterEnd - 1;
      GetQueryStringParameter := COPY(QueryString, ParameterStart, ParameterEnd)
    END
END;

BEGIN {WorkWithQueryString}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  WRITELN('First Name: ', GetQueryStringParameter('first_name'));
  WRITELN('Last Name: ', GetQueryStringParameter('last_name'));
  WRITELN('Age: ', GetQueryStringParameter('age'))
END. {WorkWithQueryString}


