create table reserve(
	id varchar(10) not null,
	quantity int,
	primary key(id),
	foreign key(id) references exhibition(id) ON DELETE CASCADE
);