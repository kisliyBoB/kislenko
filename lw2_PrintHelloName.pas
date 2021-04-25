PROGRAM PrintHelloName(INPUT, OUTPUT);
USES
  DOS;
VAR
  Name, Env: STRING;
BEGIN {PrintHello}
  WRITELN('Content-Type: text/plain');
  WRITELN;
  QueryString := GetEnv('QUERY_STRING');
  IF POS('name', QuertyString) = 0
  THEN
    WRITELN('Hello Anonymous!')
  ELSE
    BEGIN
      Name := COPY(QueryString, POS('=', QueryString) + 1, LENGTH(QueryString));
      WRITELN('Hello dear, ', Name, '!')
    END
END. {PrintHello}
