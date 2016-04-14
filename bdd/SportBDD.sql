/*==============================================================*/
/* Nom de SGBD :  Sybase SQL Anywhere 11                        */
/* Date de création :  14/04/2016 11:26:52                      */
/*==============================================================*/

/*==============================================================*/
/* Table : ARTICLE                                              */
/*==============================================================*/
create table ARTICLE 
(
   ID_ARTICLE           integer                        not null,
   ID_CATEGORIE         integer                        not null,
   ID_TEMOIGNAGE        integer                        not null,
   TITLE                varchar(50)                    null,
   DESCRIPTION          varchar(150)                   null,
   INTRODUCTION         varchar(100)                   null,
   constraint PK_ARTICLE primary key (ID_ARTICLE)
);

/*==============================================================*/
/* Index : ARTICLE_PK                                           */
/*==============================================================*/
create unique index ARTICLE_PK on ARTICLE (
ID_ARTICLE ASC
);

/*==============================================================*/
/* Index : APPARTENIR_FK                                        */
/*==============================================================*/
create index APPARTENIR_FK on ARTICLE (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Index : ASSOCIATION_3_FK                                     */
/*==============================================================*/
create index ASSOCIATION_3_FK on ARTICLE (
ID_TEMOIGNAGE ASC
);

/*==============================================================*/
/* Table : CATEGORIES                                           */
/*==============================================================*/
create table CATEGORIES 
(
   ID_CATEGORIE         integer                        not null,
   TITLE                varchar(50)                    null,
   constraint PK_CATEGORIES primary key (ID_CATEGORIE)
);

/*==============================================================*/
/* Index : CATEGORIES_PK                                        */
/*==============================================================*/
create unique index CATEGORIES_PK on CATEGORIES (
ID_CATEGORIE ASC
);

/*==============================================================*/
/* Table : PICTURE                                              */
/*==============================================================*/
create table PICTURE 
(
   ID_PICTURE           integer                        not null,
   ID_ARTICLE           integer                        not null,
   URL                  varchar(200)                   null,
   constraint PK_PICTURE primary key (ID_PICTURE)
);

/*==============================================================*/
/* Index : PICTURE_PK                                           */
/*==============================================================*/
create unique index PICTURE_PK on PICTURE (
ID_PICTURE ASC
);

/*==============================================================*/
/* Index : AVOIR_FK                                             */
/*==============================================================*/
create index AVOIR_FK on PICTURE (
ID_ARTICLE ASC
);

/*==============================================================*/
/* Table : TEMOIGNAGE                                           */
/*==============================================================*/
create table TEMOIGNAGE 
(
   ID_TEMOIGNAGE        integer                        not null,
   URL_VIDEO            varchar(200)                   null,
   DESCRIPTION          varchar(150)                   null,
   TITLE                varchar(50)                    null,
   constraint PK_TEMOIGNAGE primary key (ID_TEMOIGNAGE)
);

/*==============================================================*/
/* Index : TEMOIGNAGE_PK                                        */
/*==============================================================*/
create unique index TEMOIGNAGE_PK on TEMOIGNAGE (
ID_TEMOIGNAGE ASC
);

alter table ARTICLE
   add constraint FK_ARTICLE_APPARTENI_CATEGORI foreign key (ID_CATEGORIE)
      references CATEGORIES (ID_CATEGORIE)
      on update restrict
      on delete restrict;

alter table ARTICLE
   add constraint FK_ARTICLE_ASSOCIATI_TEMOIGNA foreign key (ID_TEMOIGNAGE)
      references TEMOIGNAGE (ID_TEMOIGNAGE)
      on update restrict
      on delete restrict;

alter table PICTURE
   add constraint FK_PICTURE_AVOIR_ARTICLE foreign key (ID_ARTICLE)
      references ARTICLE (ID_ARTICLE)
      on update restrict
      on delete restrict;

