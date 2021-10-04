/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import 'package:moor/moor.dart';

@DataClassName("NfeTransporteVolume")
class NfeTransporteVolumes extends Table {
  String get tableName => 'NFE_TRANSPORTE_VOLUME';

  IntColumn get id => integer().named('ID').autoIncrement()();
  IntColumn get idNfeTransporte => integer().named('ID_NFE_TRANSPORTE').nullable().customConstraint('NULLABLE REFERENCES NFE_TRANSPORTE(ID)')();
  IntColumn get quantidade => integer().named('QUANTIDADE').nullable()();
  TextColumn get especie => text().named('ESPECIE').withLength(min: 0, max: 60).nullable()();
  TextColumn get marca => text().named('MARCA').withLength(min: 0, max: 60).nullable()();
  TextColumn get numeracao => text().named('NUMERACAO').withLength(min: 0, max: 60).nullable()();
  RealColumn get pesoLiquido => real().named('PESO_LIQUIDO').nullable()();
  RealColumn get pesoBruto => real().named('PESO_BRUTO').nullable()();
}