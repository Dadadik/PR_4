-- public.doctors definition

-- Drop table

-- DROP TABLE doctors;

CREATE TABLE doctors (
	id_doctor serial4 NOT NULL,
	surname varchar NOT NULL,
	"Name" varchar NOT NULL,
	patronymic varchar NULL,
	specialization varchar NOT NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doctor)
);

-- Permissions

ALTER TABLE public.doctors OWNER TO postgres;
GRANT ALL ON TABLE public.doctors TO postgres;


-- public.patients definition

-- Drop table

-- DROP TABLE patients;

CREATE TABLE patients (
	id_patients serial4 NOT NULL,
	surname varchar NOT NULL,
	"name" varchar NOT NULL,
	patronymic varchar NOT NULL,
	birthday varchar NOT NULL,
	address varchar NULL,
	CONSTRAINT patients_pk PRIMARY KEY (id_patients)
);

-- Permissions

ALTER TABLE public.patients OWNER TO postgres;
GRANT ALL ON TABLE public.patients TO postgres;


-- public.session_patient definition

-- Drop table

-- DROP TABLE session_patient;

CREATE TABLE session_patient (
	id_session_patient serial4 NOT NULL,
	id_doctor int4 NOT NULL,
	id_patient int4 NOT NULL,
	cost_seeing numeric NULL,
	percent_salary numeric NULL,
	salary numeric NULL GENERATED ALWAYS AS (cost_seeing * (percent_salary / 100::numeric) * 0.87) STORED,
	CONSTRAINT session_patient_pk PRIMARY KEY (id_session_patient),
	CONSTRAINT "seesion_patient_doctors_FK" FOREIGN KEY (id_doctor) REFERENCES doctors(id_doctor) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT "seesion_patient_patient_FK" FOREIGN KEY (id_patient) REFERENCES patients(id_patients) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE public.session_patient OWNER TO postgres;
GRANT ALL ON TABLE public.session_patient TO postgres;

INSERT INTO public.doctors (id_doctor,surname,"Name",patronymic,specialization) VALUES
	 (1,'Пименов ','Александр ','Александрович','Ортопед'),
	 (2,'Жуков ','Алексей ','Львович','Терапевт'),
	 (3,'Дружинин ','Иван ','Данилович','Гинеколог'),
	 (4,'Кудряшов ','Дамир ','Никитич','Невролог'),
	 (5,'Ушаков ','Мирон ','Ярославович','Окулист'),
	 (6,'Горшкова','Анастасия ','Никитична','Психотерапевт'),
	 (7,'Румянцев ','Богдан','Михайлович','Стоматолог'),
	 (8,'Петрова ','Валерия ','Даниловна','Хирург'),
	 (9,'Егорова ','Амира ','Михайловна','Фельдшер'),
	 (10,'Никитина ','Елена ','Романовна','Акушер');
INSERT INTO public.patients (id_patients,surname,"name",patronymic,birthday,address) VALUES
	 (1,'Лапшин ','Тимофей ','Романович','07.10.1994','Рязанская область, город Истра, шоссе Ломоносова, 67'),
	 (2,'Давыдов ','Давид ','Артёмович','19.11.1993','Тюменская область, город Щёлково, пр. Сталина, 83'),
	 (3,'Фомин ','Егор ','Максимович','24.01.1991','Архангельская область, город Серпухов, наб. Чехова, 35'),
	 (4,'Попов ','Андрей ','Тимофеевич','09.08.1982','Архангельская область, город Воскресенск, шоссе'),
	 (5,'Калашников ','Георгий ','Иванович','03.09.1997','Читинская область, город Егорьевск, въезд Чехова, 91'),
	 (6,'Дроздов ','Павел ','Ильич','01.03.1996','Читинская область, город Лотошино, бульвар Космонавтов, 39'),
	 (7,'Коршунова ','Амира ','Яновна','15.07.1999','Костромская область, город Лотошино, въезд Гагарина, 58'),
	 (8,'Романова','Алёна ','Ивановна','12.05.2006','Иркутская область, город Чехов, проезд Гоголя, 97'),
	 (9,'Артамонов ','Михаил ','Матвеевич','05.04.1995','Вологодская область, город Кашира, пл. Балканская, 27'),
	 (10,'Жданов ','Тимофей ','Максимович','28.07.1988','Кемеровская область, город Дмитров, въезд Гагарина, 22');
INSERT INTO public.session_patient (id_session_patient,id_doctor,id_patient,cost_seeing,percent_salary) VALUES
	 (2,1,1,1500,10),
	 (3,2,2,2000,10),
	 (4,3,3,3000,10),
	 (5,4,4,1000,10),
	 (6,5,5,5000,10),
	 (7,6,6,4000,10),
	 (8,7,7,2500,10),
	 (9,8,8,3000,10),
	 (10,9,9,500,10),
	 (11,10,10,7000,10);