/*
Title: T2Ti ERP Pegasus                                                                
Description: Table Moor relacionada à tabela [COMANDA] 
                                                                                
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

@DataClassName("Comanda")
@UseRowClass(Comanda)
class Comandas extends Table {
  @override
  String get tableName => 'COMANDA';

  IntColumn get id => integer().named('ID').autoIncrement()();
  IntColumn get idColaborador => integer().named('ID_COLABORADOR').nullable().customConstraint('NULLABLE REFERENCES COLABORADOR(ID)')();
  IntColumn get idMesa => integer().named('ID_MESA').nullable().customConstraint('NULLABLE REFERENCES MESA(ID)')();
  IntColumn get idCliente => integer().named('ID_CLIENTE').nullable().customConstraint('NULLABLE REFERENCES CLIENTE(ID)')();
  IntColumn get idEmpresaDeliveryPedido => integer().named('ID_EMPRESA_DELIVERY_PEDIDO').nullable().customConstraint('NULLABLE REFERENCES EMPRESA_DELIVERY_PEDIDO(ID)')();
  IntColumn get numero => integer().named('NUMERO').nullable()();
  DateTimeColumn get dataChegada => dateTime().named('DATA_CHEGADA').nullable()();
  TextColumn get horaChegada => text().named('HORA_CHEGADA').withLength(min: 0, max: 8).nullable()();
  DateTimeColumn get dataSaida => dateTime().named('DATA_SAIDA').nullable()();
  TextColumn get horaSaida => text().named('HORA_SAIDA').withLength(min: 0, max: 8).nullable()();
  RealColumn get total => real().named('TOTAL').nullable()();
  TextColumn get tipo => text().named('TIPO').withLength(min: 0, max: 1).nullable()();
  IntColumn get quantidadePessoas => integer().named('QUANTIDADE_PESSOAS').nullable()();
  RealColumn get valorPorPessoa => real().named('VALOR_POR_PESSOA').nullable()();
}

class Comanda extends DataClass implements Insertable<Comanda> {
  final int? id;
  final int? idColaborador;
  final int? idMesa;
  final int? idCliente;
  final int? idEmpresaDeliveryPedido;
  final int? numero;
  final DateTime? dataChegada;
  final String? horaChegada;
  final DateTime? dataSaida;
  final String? horaSaida;
  final double? total;
  final String? tipo;
  final int? quantidadePessoas;
  final double? valorPorPessoa;

  Comanda(
    {
      required this.id,
      this.idColaborador,
      this.idMesa,
      this.idCliente,
      this.idEmpresaDeliveryPedido,
      this.numero,
      this.dataChegada,
      this.horaChegada,
      this.dataSaida,
      this.horaSaida,
      this.total,
      this.tipo,
      this.quantidadePessoas,
      this.valorPorPessoa,
    }
  );

  factory Comanda.fromData(Map<String, dynamic> data, GeneratedDatabase db, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Comanda(
      id: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID']),
      idColaborador: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID_COLABORADOR']),
      idMesa: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID_MESA']),
      idCliente: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID_CLIENTE']),
      idEmpresaDeliveryPedido: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}ID_EMPRESA_DELIVERY_PEDIDO']),
      numero: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}NUMERO']),
      dataChegada: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}DATA_CHEGADA']),
      horaChegada: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}HORA_CHEGADA']),
      dataSaida: const DateTimeType().mapFromDatabaseResponse(data['${effectivePrefix}DATA_SAIDA']),
      horaSaida: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}HORA_SAIDA']),
      total: const RealType().mapFromDatabaseResponse(data['${effectivePrefix}TOTAL']),
      tipo: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}TIPO']),
      quantidadePessoas: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}QUANTIDADE_PESSOAS']),
      valorPorPessoa: const RealType().mapFromDatabaseResponse(data['${effectivePrefix}VALOR_POR_PESSOA']),
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['ID'] = Variable<int?>(id);
    }
    if (!nullToAbsent || idColaborador != null) {
      map['ID_COLABORADOR'] = Variable<int?>(idColaborador);
    }
    if (!nullToAbsent || idMesa != null) {
      map['ID_MESA'] = Variable<int?>(idMesa);
    }
    if (!nullToAbsent || idCliente != null) {
      map['ID_CLIENTE'] = Variable<int?>(idCliente);
    }
    if (!nullToAbsent || idEmpresaDeliveryPedido != null) {
      map['ID_EMPRESA_DELIVERY_PEDIDO'] = Variable<int?>(idEmpresaDeliveryPedido);
    }
    if (!nullToAbsent || numero != null) {
      map['NUMERO'] = Variable<int?>(numero);
    }
    if (!nullToAbsent || dataChegada != null) {
      map['DATA_CHEGADA'] = Variable<DateTime?>(dataChegada);
    }
    if (!nullToAbsent || horaChegada != null) {
      map['HORA_CHEGADA'] = Variable<String?>(horaChegada);
    }
    if (!nullToAbsent || dataSaida != null) {
      map['DATA_SAIDA'] = Variable<DateTime?>(dataSaida);
    }
    if (!nullToAbsent || horaSaida != null) {
      map['HORA_SAIDA'] = Variable<String?>(horaSaida);
    }
    if (!nullToAbsent || total != null) {
      map['TOTAL'] = Variable<double?>(total);
    }
    if (!nullToAbsent || tipo != null) {
      map['TIPO'] = Variable<String?>(tipo);
    }
    if (!nullToAbsent || quantidadePessoas != null) {
      map['QUANTIDADE_PESSOAS'] = Variable<int?>(quantidadePessoas);
    }
    if (!nullToAbsent || valorPorPessoa != null) {
      map['VALOR_POR_PESSOA'] = Variable<double?>(valorPorPessoa);
    }
    return map;
  }

  ComandasCompanion toCompanion(bool nullToAbsent) {
    return ComandasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      idColaborador: idColaborador == null && nullToAbsent
        ? const Value.absent()
        : Value(idColaborador),
      idMesa: idMesa == null && nullToAbsent
        ? const Value.absent()
        : Value(idMesa),
      idCliente: idCliente == null && nullToAbsent
        ? const Value.absent()
        : Value(idCliente),
      idEmpresaDeliveryPedido: idEmpresaDeliveryPedido == null && nullToAbsent
        ? const Value.absent()
        : Value(idEmpresaDeliveryPedido),
      numero: numero == null && nullToAbsent
        ? const Value.absent()
        : Value(numero),
      dataChegada: dataChegada == null && nullToAbsent
        ? const Value.absent()
        : Value(dataChegada),
      horaChegada: horaChegada == null && nullToAbsent
        ? const Value.absent()
        : Value(horaChegada),
      dataSaida: dataSaida == null && nullToAbsent
        ? const Value.absent()
        : Value(dataSaida),
      horaSaida: horaSaida == null && nullToAbsent
        ? const Value.absent()
        : Value(horaSaida),
      total: total == null && nullToAbsent
        ? const Value.absent()
        : Value(total),
      tipo: tipo == null && nullToAbsent
        ? const Value.absent()
        : Value(tipo),
      quantidadePessoas: quantidadePessoas == null && nullToAbsent
        ? const Value.absent()
        : Value(quantidadePessoas),
      valorPorPessoa: valorPorPessoa == null && nullToAbsent
        ? const Value.absent()
        : Value(valorPorPessoa),
    );
  }

  factory Comanda.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Comanda(
      id: serializer.fromJson<int>(json['id']),
      idColaborador: serializer.fromJson<int>(json['idColaborador']),
      idMesa: serializer.fromJson<int>(json['idMesa']),
      idCliente: serializer.fromJson<int>(json['idCliente']),
      idEmpresaDeliveryPedido: serializer.fromJson<int>(json['idEmpresaDeliveryPedido']),
      numero: serializer.fromJson<int>(json['numero']),
      dataChegada: serializer.fromJson<DateTime>(json['dataChegada']),
      horaChegada: serializer.fromJson<String>(json['horaChegada']),
      dataSaida: serializer.fromJson<DateTime>(json['dataSaida']),
      horaSaida: serializer.fromJson<String>(json['horaSaida']),
      total: serializer.fromJson<double>(json['total']),
      tipo: serializer.fromJson<String>(json['tipo']),
      quantidadePessoas: serializer.fromJson<int>(json['quantidadePessoas']),
      valorPorPessoa: serializer.fromJson<double>(json['valorPorPessoa']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int?>(id),
      'idColaborador': serializer.toJson<int?>(idColaborador),
      'idMesa': serializer.toJson<int?>(idMesa),
      'idCliente': serializer.toJson<int?>(idCliente),
      'idEmpresaDeliveryPedido': serializer.toJson<int?>(idEmpresaDeliveryPedido),
      'numero': serializer.toJson<int?>(numero),
      'dataChegada': serializer.toJson<DateTime?>(dataChegada),
      'horaChegada': serializer.toJson<String?>(horaChegada),
      'dataSaida': serializer.toJson<DateTime?>(dataSaida),
      'horaSaida': serializer.toJson<String?>(horaSaida),
      'total': serializer.toJson<double?>(total),
      'tipo': serializer.toJson<String?>(tipo),
      'quantidadePessoas': serializer.toJson<int?>(quantidadePessoas),
      'valorPorPessoa': serializer.toJson<double?>(valorPorPessoa),
    };
  }

  Comanda copyWith(
        {
		  int? id,
          int? idColaborador,
          int? idMesa,
          int? idCliente,
          int? idEmpresaDeliveryPedido,
          int? numero,
          DateTime? dataChegada,
          String? horaChegada,
          DateTime? dataSaida,
          String? horaSaida,
          double? total,
          String? tipo,
          int? quantidadePessoas,
          double? valorPorPessoa,
		}) =>
      Comanda(
        id: id ?? this.id,
        idColaborador: idColaborador ?? this.idColaborador,
        idMesa: idMesa ?? this.idMesa,
        idCliente: idCliente ?? this.idCliente,
        idEmpresaDeliveryPedido: idEmpresaDeliveryPedido ?? this.idEmpresaDeliveryPedido,
        numero: numero ?? this.numero,
        dataChegada: dataChegada ?? this.dataChegada,
        horaChegada: horaChegada ?? this.horaChegada,
        dataSaida: dataSaida ?? this.dataSaida,
        horaSaida: horaSaida ?? this.horaSaida,
        total: total ?? this.total,
        tipo: tipo ?? this.tipo,
        quantidadePessoas: quantidadePessoas ?? this.quantidadePessoas,
        valorPorPessoa: valorPorPessoa ?? this.valorPorPessoa,
      );
  
  @override
  String toString() {
    return (StringBuffer('Comanda(')
          ..write('id: $id, ')
          ..write('idColaborador: $idColaborador, ')
          ..write('idMesa: $idMesa, ')
          ..write('idCliente: $idCliente, ')
          ..write('idEmpresaDeliveryPedido: $idEmpresaDeliveryPedido, ')
          ..write('numero: $numero, ')
          ..write('dataChegada: $dataChegada, ')
          ..write('horaChegada: $horaChegada, ')
          ..write('dataSaida: $dataSaida, ')
          ..write('horaSaida: $horaSaida, ')
          ..write('total: $total, ')
          ..write('tipo: $tipo, ')
          ..write('quantidadePessoas: $quantidadePessoas, ')
          ..write('valorPorPessoa: $valorPorPessoa, ')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
      id,
      idColaborador,
      idMesa,
      idCliente,
      idEmpresaDeliveryPedido,
      numero,
      dataChegada,
      horaChegada,
      dataSaida,
      horaSaida,
      total,
      tipo,
      quantidadePessoas,
      valorPorPessoa,
	]);
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comanda &&
          other.id == id &&
          other.idColaborador == idColaborador &&
          other.idMesa == idMesa &&
          other.idCliente == idCliente &&
          other.idEmpresaDeliveryPedido == idEmpresaDeliveryPedido &&
          other.numero == numero &&
          other.dataChegada == dataChegada &&
          other.horaChegada == horaChegada &&
          other.dataSaida == dataSaida &&
          other.horaSaida == horaSaida &&
          other.total == total &&
          other.tipo == tipo &&
          other.quantidadePessoas == quantidadePessoas &&
          other.valorPorPessoa == valorPorPessoa 
	   );
}

class ComandasCompanion extends UpdateCompanion<Comanda> {

  final Value<int?> id;
  final Value<int?> idColaborador;
  final Value<int?> idMesa;
  final Value<int?> idCliente;
  final Value<int?> idEmpresaDeliveryPedido;
  final Value<int?> numero;
  final Value<DateTime?> dataChegada;
  final Value<String?> horaChegada;
  final Value<DateTime?> dataSaida;
  final Value<String?> horaSaida;
  final Value<double?> total;
  final Value<String?> tipo;
  final Value<int?> quantidadePessoas;
  final Value<double?> valorPorPessoa;

  const ComandasCompanion({
    this.id = const Value.absent(),
    this.idColaborador = const Value.absent(),
    this.idMesa = const Value.absent(),
    this.idCliente = const Value.absent(),
    this.idEmpresaDeliveryPedido = const Value.absent(),
    this.numero = const Value.absent(),
    this.dataChegada = const Value.absent(),
    this.horaChegada = const Value.absent(),
    this.dataSaida = const Value.absent(),
    this.horaSaida = const Value.absent(),
    this.total = const Value.absent(),
    this.tipo = const Value.absent(),
    this.quantidadePessoas = const Value.absent(),
    this.valorPorPessoa = const Value.absent(),
  });

  ComandasCompanion.insert({
    this.id = const Value.absent(),
    this.idColaborador = const Value.absent(),
    this.idMesa = const Value.absent(),
    this.idCliente = const Value.absent(),
    this.idEmpresaDeliveryPedido = const Value.absent(),
    this.numero = const Value.absent(),
    this.dataChegada = const Value.absent(),
    this.horaChegada = const Value.absent(),
    this.dataSaida = const Value.absent(),
    this.horaSaida = const Value.absent(),
    this.total = const Value.absent(),
    this.tipo = const Value.absent(),
    this.quantidadePessoas = const Value.absent(),
    this.valorPorPessoa = const Value.absent(),
  });

  static Insertable<Comanda> custom({
    Expression<int>? id,
    Expression<int>? idColaborador,
    Expression<int>? idMesa,
    Expression<int>? idCliente,
    Expression<int>? idEmpresaDeliveryPedido,
    Expression<int>? numero,
    Expression<DateTime>? dataChegada,
    Expression<String>? horaChegada,
    Expression<DateTime>? dataSaida,
    Expression<String>? horaSaida,
    Expression<double>? total,
    Expression<String>? tipo,
    Expression<int>? quantidadePessoas,
    Expression<double>? valorPorPessoa,
  }) {
    return RawValuesInsertable({
      if (id != null) 'ID': id,
      if (idColaborador != null) 'ID_COLABORADOR': idColaborador,
      if (idMesa != null) 'ID_MESA': idMesa,
      if (idCliente != null) 'ID_CLIENTE': idCliente,
      if (idEmpresaDeliveryPedido != null) 'ID_EMPRESA_DELIVERY_PEDIDO': idEmpresaDeliveryPedido,
      if (numero != null) 'NUMERO': numero,
      if (dataChegada != null) 'DATA_CHEGADA': dataChegada,
      if (horaChegada != null) 'HORA_CHEGADA': horaChegada,
      if (dataSaida != null) 'DATA_SAIDA': dataSaida,
      if (horaSaida != null) 'HORA_SAIDA': horaSaida,
      if (total != null) 'TOTAL': total,
      if (tipo != null) 'TIPO': tipo,
      if (quantidadePessoas != null) 'QUANTIDADE_PESSOAS': quantidadePessoas,
      if (valorPorPessoa != null) 'VALOR_POR_PESSOA': valorPorPessoa,
    });
  }

  ComandasCompanion copyWith(
      {
	  Value<int>? id,
      Value<int>? idColaborador,
      Value<int>? idMesa,
      Value<int>? idCliente,
      Value<int>? idEmpresaDeliveryPedido,
      Value<int>? numero,
      Value<DateTime>? dataChegada,
      Value<String>? horaChegada,
      Value<DateTime>? dataSaida,
      Value<String>? horaSaida,
      Value<double>? total,
      Value<String>? tipo,
      Value<int>? quantidadePessoas,
      Value<double>? valorPorPessoa,
	  }) {
    return ComandasCompanion(
      id: id ?? this.id,
      idColaborador: idColaborador ?? this.idColaborador,
      idMesa: idMesa ?? this.idMesa,
      idCliente: idCliente ?? this.idCliente,
      idEmpresaDeliveryPedido: idEmpresaDeliveryPedido ?? this.idEmpresaDeliveryPedido,
      numero: numero ?? this.numero,
      dataChegada: dataChegada ?? this.dataChegada,
      horaChegada: horaChegada ?? this.horaChegada,
      dataSaida: dataSaida ?? this.dataSaida,
      horaSaida: horaSaida ?? this.horaSaida,
      total: total ?? this.total,
      tipo: tipo ?? this.tipo,
      quantidadePessoas: quantidadePessoas ?? this.quantidadePessoas,
      valorPorPessoa: valorPorPessoa ?? this.valorPorPessoa,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['ID'] = Variable<int?>(id.value);
    }
    if (idColaborador.present) {
      map['ID_COLABORADOR'] = Variable<int?>(idColaborador.value);
    }
    if (idMesa.present) {
      map['ID_MESA'] = Variable<int?>(idMesa.value);
    }
    if (idCliente.present) {
      map['ID_CLIENTE'] = Variable<int?>(idCliente.value);
    }
    if (idEmpresaDeliveryPedido.present) {
      map['ID_EMPRESA_DELIVERY_PEDIDO'] = Variable<int?>(idEmpresaDeliveryPedido.value);
    }
    if (numero.present) {
      map['NUMERO'] = Variable<int?>(numero.value);
    }
    if (dataChegada.present) {
      map['DATA_CHEGADA'] = Variable<DateTime?>(dataChegada.value);
    }
    if (horaChegada.present) {
      map['HORA_CHEGADA'] = Variable<String?>(horaChegada.value);
    }
    if (dataSaida.present) {
      map['DATA_SAIDA'] = Variable<DateTime?>(dataSaida.value);
    }
    if (horaSaida.present) {
      map['HORA_SAIDA'] = Variable<String?>(horaSaida.value);
    }
    if (total.present) {
      map['TOTAL'] = Variable<double?>(total.value);
    }
    if (tipo.present) {
      map['TIPO'] = Variable<String?>(tipo.value);
    }
    if (quantidadePessoas.present) {
      map['QUANTIDADE_PESSOAS'] = Variable<int?>(quantidadePessoas.value);
    }
    if (valorPorPessoa.present) {
      map['VALOR_POR_PESSOA'] = Variable<double?>(valorPorPessoa.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ComandasCompanion(')
          ..write('id: $id, ')
          ..write('idColaborador: $idColaborador, ')
          ..write('idMesa: $idMesa, ')
          ..write('idCliente: $idCliente, ')
          ..write('idEmpresaDeliveryPedido: $idEmpresaDeliveryPedido, ')
          ..write('numero: $numero, ')
          ..write('dataChegada: $dataChegada, ')
          ..write('horaChegada: $horaChegada, ')
          ..write('dataSaida: $dataSaida, ')
          ..write('horaSaida: $horaSaida, ')
          ..write('total: $total, ')
          ..write('tipo: $tipo, ')
          ..write('quantidadePessoas: $quantidadePessoas, ')
          ..write('valorPorPessoa: $valorPorPessoa, ')
          ..write(')'))
        .toString();
  }
}

class $ComandasTable extends Comandas
    with TableInfo<$ComandasTable, Comanda> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ComandasTable(this._db, [this._alias]);
  
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedColumn<int>? _id;
  @override
  GeneratedColumn<int> get id =>
      _id ??= GeneratedColumn<int>('ID', aliasedName, false,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');

  final VerificationMeta _idColaboradorMeta =
      const VerificationMeta('idColaborador');
  GeneratedColumn<int>? _idColaborador;
  @override
  GeneratedColumn<int> get idColaborador =>
      _idColaborador ??= GeneratedColumn<int>('ID_COLABORADOR', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          $customConstraints: 'NULLABLE REFERENCES COLABORADOR(ID)');
  final VerificationMeta _idMesaMeta =
      const VerificationMeta('idMesa');
  GeneratedColumn<int>? _idMesa;
  @override
  GeneratedColumn<int> get idMesa =>
      _idMesa ??= GeneratedColumn<int>('ID_MESA', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          $customConstraints: 'NULLABLE REFERENCES MESA(ID)');
  final VerificationMeta _idClienteMeta =
      const VerificationMeta('idCliente');
  GeneratedColumn<int>? _idCliente;
  @override
  GeneratedColumn<int> get idCliente =>
      _idCliente ??= GeneratedColumn<int>('ID_CLIENTE', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          $customConstraints: 'NULLABLE REFERENCES CLIENTE(ID)');
  final VerificationMeta _idEmpresaDeliveryPedidoMeta =
      const VerificationMeta('idEmpresaDeliveryPedido');
  GeneratedColumn<int>? _idEmpresaDeliveryPedido;
  @override
  GeneratedColumn<int> get idEmpresaDeliveryPedido =>
      _idEmpresaDeliveryPedido ??= GeneratedColumn<int>('ID_EMPRESA_DELIVERY_PEDIDO', aliasedName, true,
          typeName: 'INTEGER',
          requiredDuringInsert: false,
          $customConstraints: 'NULLABLE REFERENCES EMPRESA_DELIVERY_PEDIDO(ID)');
  final VerificationMeta _numeroMeta =
      const VerificationMeta('numero');
  GeneratedColumn<int>? _numero;
  @override
  GeneratedColumn<int> get numero => _numero ??=
      GeneratedColumn<int>('NUMERO', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _dataChegadaMeta =
      const VerificationMeta('dataChegada');
  GeneratedColumn<DateTime>? _dataChegada;
  @override
  GeneratedColumn<DateTime> get dataChegada => _dataChegada ??=
      GeneratedColumn<DateTime>('DATA_CHEGADA', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _horaChegadaMeta =
      const VerificationMeta('horaChegada');
  GeneratedColumn<String>? _horaChegada;
  @override
  GeneratedColumn<String> get horaChegada => _horaChegada ??=
      GeneratedColumn<String>('HORA_CHEGADA', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _dataSaidaMeta =
      const VerificationMeta('dataSaida');
  GeneratedColumn<DateTime>? _dataSaida;
  @override
  GeneratedColumn<DateTime> get dataSaida => _dataSaida ??=
      GeneratedColumn<DateTime>('DATA_SAIDA', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _horaSaidaMeta =
      const VerificationMeta('horaSaida');
  GeneratedColumn<String>? _horaSaida;
  @override
  GeneratedColumn<String> get horaSaida => _horaSaida ??=
      GeneratedColumn<String>('HORA_SAIDA', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _totalMeta =
      const VerificationMeta('total');
  GeneratedColumn<double>? _total;
  @override
  GeneratedColumn<double> get total => _total ??=
      GeneratedColumn<double>('TOTAL', aliasedName, true,
          typeName: 'REAL', requiredDuringInsert: false);
  final VerificationMeta _tipoMeta =
      const VerificationMeta('tipo');
  GeneratedColumn<String>? _tipo;
  @override
  GeneratedColumn<String> get tipo => _tipo ??=
      GeneratedColumn<String>('TIPO', aliasedName, true,
          typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _quantidadePessoasMeta =
      const VerificationMeta('quantidadePessoas');
  GeneratedColumn<int>? _quantidadePessoas;
  @override
  GeneratedColumn<int> get quantidadePessoas => _quantidadePessoas ??=
      GeneratedColumn<int>('QUANTIDADE_PESSOAS', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _valorPorPessoaMeta =
      const VerificationMeta('valorPorPessoa');
  GeneratedColumn<double>? _valorPorPessoa;
  @override
  GeneratedColumn<double> get valorPorPessoa => _valorPorPessoa ??=
      GeneratedColumn<double>('VALOR_POR_PESSOA', aliasedName, true,
          typeName: 'REAL', requiredDuringInsert: false);
		    
  @override
  List<GeneratedColumn> get $columns => [
        id,
        idColaborador,
        idMesa,
        idCliente,
        idEmpresaDeliveryPedido,
        numero,
        dataChegada,
        horaChegada,
        dataSaida,
        horaSaida,
        total,
        tipo,
        quantidadePessoas,
        valorPorPessoa,
      ];

  @override
  String get aliasedName => _alias ?? 'COMANDA';
  
  @override
  String get actualTableName => 'COMANDA';
  
  @override
  VerificationContext validateIntegrity(Insertable<Comanda> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['ID']!, _idMeta));
    }
    if (data.containsKey('ID_COLABORADOR')) {
        context.handle(_idColaboradorMeta,
            idColaborador.isAcceptableOrUnknown(data['ID_COLABORADOR']!, _idColaboradorMeta));
    }
    if (data.containsKey('ID_MESA')) {
        context.handle(_idMesaMeta,
            idMesa.isAcceptableOrUnknown(data['ID_MESA']!, _idMesaMeta));
    }
    if (data.containsKey('ID_CLIENTE')) {
        context.handle(_idClienteMeta,
            idCliente.isAcceptableOrUnknown(data['ID_CLIENTE']!, _idClienteMeta));
    }
    if (data.containsKey('ID_EMPRESA_DELIVERY_PEDIDO')) {
        context.handle(_idEmpresaDeliveryPedidoMeta,
            idEmpresaDeliveryPedido.isAcceptableOrUnknown(data['ID_EMPRESA_DELIVERY_PEDIDO']!, _idEmpresaDeliveryPedidoMeta));
    }
    if (data.containsKey('NUMERO')) {
        context.handle(_numeroMeta,
            numero.isAcceptableOrUnknown(data['NUMERO']!, _numeroMeta));
    }
    if (data.containsKey('DATA_CHEGADA')) {
        context.handle(_dataChegadaMeta,
            dataChegada.isAcceptableOrUnknown(data['DATA_CHEGADA']!, _dataChegadaMeta));
    }
    if (data.containsKey('HORA_CHEGADA')) {
        context.handle(_horaChegadaMeta,
            horaChegada.isAcceptableOrUnknown(data['HORA_CHEGADA']!, _horaChegadaMeta));
    }
    if (data.containsKey('DATA_SAIDA')) {
        context.handle(_dataSaidaMeta,
            dataSaida.isAcceptableOrUnknown(data['DATA_SAIDA']!, _dataSaidaMeta));
    }
    if (data.containsKey('HORA_SAIDA')) {
        context.handle(_horaSaidaMeta,
            horaSaida.isAcceptableOrUnknown(data['HORA_SAIDA']!, _horaSaidaMeta));
    }
    if (data.containsKey('TOTAL')) {
        context.handle(_totalMeta,
            total.isAcceptableOrUnknown(data['TOTAL']!, _totalMeta));
    }
    if (data.containsKey('TIPO')) {
        context.handle(_tipoMeta,
            tipo.isAcceptableOrUnknown(data['TIPO']!, _tipoMeta));
    }
    if (data.containsKey('QUANTIDADE_PESSOAS')) {
        context.handle(_quantidadePessoasMeta,
            quantidadePessoas.isAcceptableOrUnknown(data['QUANTIDADE_PESSOAS']!, _quantidadePessoasMeta));
    }
    if (data.containsKey('VALOR_POR_PESSOA')) {
        context.handle(_valorPorPessoaMeta,
            valorPorPessoa.isAcceptableOrUnknown(data['VALOR_POR_PESSOA']!, _valorPorPessoaMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Comanda map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Comanda.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ComandasTable createAlias(String alias) {
    return $ComandasTable(_db, alias);
  }
}