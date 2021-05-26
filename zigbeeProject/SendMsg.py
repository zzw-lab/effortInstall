from flask import Flask,request

from geventwebsocket.websocket import WebSocket
from socket import socket, AF_INET, SOCK_DGRAM
from geventwebsocket.handler import WebSocketHandler
from geventwebsocket.server import WSGIServer

app = Flask(__name__)


@app.route('/msg',methods=["GET"])
def ichat():
    ws_socket = request.environ.get('wsgi.websocket')  # type:WebSocket
    try:
        while True:
            msg = ws_socket.receive()
            udp_socket = socket(AF_INET, SOCK_DGRAM)

            dest_addr = ('192.168.0.88', 5000)

            msg=bytes.fromhex(msg)

            print(msg)
            print(msg.hex())

            udp_socket.sendto(msg, dest_addr)

            udp_socket.close()
            ws_socket.send(b'xxx')
    except:
        pass
    return '200 ok!'


if __name__ == '__main__':
    http_server = WSGIServer(('0.0.0.0', 5000), app, handler_class=WebSocketHandler)
    http_server.serve_forever()