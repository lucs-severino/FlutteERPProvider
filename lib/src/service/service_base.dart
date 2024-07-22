// configuração base para os serviços rest
class ServiceBase {
  static const _porta = '8080';
  static const _enderecoServidor = 'http://localhost';
  static const _endpoint = _enderecoServidor + ':' + _porta;

  get endpoint => _endpoint;
}
