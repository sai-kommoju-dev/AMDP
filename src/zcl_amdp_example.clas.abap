CLASS zcl_amdp_example DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  TYPES:BEGIN OF ty_cust,
        kunnr TYPE kunnr,
        land1 TYPE LAND1_GP,
        name1 TYPE NAME1_GP,
        ort01 TYPE ORT01_GP,
        END OF ty_cust,
     tt_cust TYPE TABLE OF ty_cust.
    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS fetch_customer IMPORTING VALUE(lv_kunnr) TYPE kunnr
                           EXPORTING VALUE(lt_cust) TYPE tt_cust.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_amdp_example IMPLEMENTATION.
  METHOD fetch_customer BY DATABASE PROCEDURE
                        FOR HDB
                        LANGUAGE SQLSCRIPT OPTIONS READ-ONLY
                        USING kna1.
   lt_cust = SELECT kunnr,
                    land1,
                    name1,
                    ort01 FROM kna1
                    WHERE kunnr = :lv_kunnr ;
  ENDMETHOD.

ENDCLASS.
