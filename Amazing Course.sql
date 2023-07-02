/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     07/03/2023 10:54:28                          */
/*==============================================================*/


drop table if exists ANGGOTA;

drop table if exists DETAILPENDAFTARAN;

drop table if exists HEADERPENDAFTARAN;

drop table if exists KASIR;

drop table if exists KURSUS;

/*==============================================================*/
/* Table: ANGGOTA                                               */
/*==============================================================*/
create table ANGGOTA
(
   KDANGGOTA            char(5) not null,
   NAMA                 varchar(30) not null,
   ALAMAT               varchar(50),
   TELP                 int,
   primary key (KDANGGOTA)
);

/*==============================================================*/
/* Table: DETAILPENDAFTARAN                                     */
/*==============================================================*/
create table DETAILPENDAFTARAN
(
   KDKURSUS             char(5) not null,
   KDPENDAFTARAN        char(5) not null,
   primary key (KDKURSUS, KDPENDAFTARAN)
);

/*==============================================================*/
/* Table: HEADERPENDAFTARAN                                     */
/*==============================================================*/
create table HEADERPENDAFTARAN
(
   KDPENDAFTARAN        char(5) not null,
   KDANGGOTA            char(5),
   KDKASIR              char(5),
   TANGGALPENDAFTARAN   datetime,
   primary key (KDPENDAFTARAN)
);

/*==============================================================*/
/* Table: KASIR                                                 */
/*==============================================================*/
create table KASIR
(
   KDKASIR              char(5) not null,
   NAMA                 varchar(30) not null,
   ALAMAT               varchar(50),
   TELP                 int,
   primary key (KDKASIR)
);

/*==============================================================*/
/* Table: KURSUS                                                */
/*==============================================================*/
create table KURSUS
(
   KDKURSUS             char(5) not null,
   NAMAKURSUS           varchar(30) not null,
   BIAYA                int,
   primary key (KDKURSUS)
);

alter table DETAILPENDAFTARAN add constraint FK_MEMILIH foreign key (KDKURSUS)
      references KURSUS (KDKURSUS) on delete restrict on update restrict;

alter table DETAILPENDAFTARAN add constraint FK_MEMILIH2 foreign key (KDPENDAFTARAN)
      references HEADERPENDAFTARAN (KDPENDAFTARAN) on delete restrict on update restrict;

alter table HEADERPENDAFTARAN add constraint FK_MELAKUKAN foreign key (KDANGGOTA)
      references ANGGOTA (KDANGGOTA) on delete restrict on update restrict;

alter table HEADERPENDAFTARAN add constraint FK_MEMBAYAR foreign key (KDKASIR)
      references KASIR (KDKASIR) on delete restrict on update restrict;

