select a.roomcode,a.name roomname,b.name typename,a.howmany,a.howmuch
from room a, roomtype b 
where a.type =b.typecode order by roomname;
select *from room;
commit;
