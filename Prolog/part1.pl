:- dynamic(room/4).
:- dynamic(course/5).
:- dynamic(student/2).

room(r1,10,8,17).
room(r2,15,8,17).
room(r3,13,8,17).

course(c1,i1,10,9,12).
course(c2,i2,16,10,11).
course(c3,i3,14,7,11).
course(c4,i4,11,13,14).

student(s1,c1).

room_assignment_to_class(R,C) :- 
	room(R,RoomCapacity,FromTime,TillTime), 
	course(C,Instructor,CourseCapacity,FTC,TTC),
	FTC >= FromTime, TillTime >= TTC,
	RoomCapacity >= CourseCapacity.

course_conflict(C1,C2) :- 
	course(C1,I1,CC1,FTC1,TTC1),
	course(C2,I2,CC2,FTC2,TTC2),
	not(C1 = C2),
	(between(FTC1,TTC1,FTC2); between(FTC1,TTC1,TTC2); between(FTC2,TTC2,FTC1); between(FTC2,TTC2,TTC1)),
	write("There is conflict between these two course.").


add_room :- 
	write("What is the ID of the new room?"),nl,
	read(R),
	write("What is the capacity of the new room?"),nl,
	read(C),
	write("What is the opening time of the new room?"),nl,
	read(FT),
	write("What is the closing time of the new room?"),nl,
	read(TT),
	assert(room(R,C,FT,TT)).

add_course :-
	write("What is the ID of the new course?"),nl,
	read(C),
	write("Who is the instructor of the new course?"),nl,
	read(I),
	write("What is the capacity of the new course?"),nl,
	read(CC),
	write("What is the start time of the new class?"),nl,
	read(ST),
	write("What is the finish time of the new class?"),nl,
	read(FT),
	assert(course(C,I,CC,ST,FT)).

add_student :-
	write("What is the name of the new student?"),nl,
	read(Name),
	write("Which course he/she takes?"),nl,
	read(Course),
	assert(student(Name,Course)).
