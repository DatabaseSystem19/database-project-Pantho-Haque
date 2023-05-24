

set serveroutput on

declare
    counter number;
    demand_of_blood varchar(10);

    cursor post_cursor is select * from posts;
    post_row posts%rowtype;

    name accounts.name%type;
    -- array
    TYPE arrayType IS VARRAY(10) OF posts.post_date%type;
    arr arrayType:=arrayType();
    
    i number;j number; k number;


PROCEDURE findAdd(num1 IN number, num2 IN number, total OUT number) IS
BEGIN
   total := num1 + num2;
END;

function findAddFunc(num1 IN number, num2 IN number) return number AS total number;
BEGIN
   total := num1 + num2;
   return total;
END;


begin
    open post_cursor;
    fetch post_cursor into post_row;
    while post_cursor%found 
        loop
            if post_row.number_of_bags<=4 and post_row.number_of_bags>=3 
                then demand_of_blood:='huge';
            elsif post_row.number_of_bags=2
                then demand_of_blood:='medium';
            else demand_of_blood:='low';
            end if;
            arr.extend();
            arr(post_cursor%rowcount):=post_row.post_date;
            dbms_output.put_line('post Id: '|| post_row.post_id || CHR(9) || 'NOB: ' || post_row.number_of_bags || CHR(9) ||  'demand: ' || demand_of_blood || 'Row count: '|| post_cursor%rowcount );
            fetch post_cursor into post_row;
        end loop;
    close post_cursor;
    counter:=1;
    WHILE counter<=arr.COUNT 
        LOOP 
            DBMS_OUTPUT.PUT_LINE(arr(counter)); 
            counter:=counter+1;
        END LOOP;
    
    i:=2;j:=3;
    
    findAdd(i,j,k);
    dbms_output.put_line('the sum using procedure is : ' || k);
    
    k:=findAddFunc(i,j);
    dbms_output.put_line('the sum using function is : ' || k);
end;
