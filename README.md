# gst_sender

## TCP version

### Sota (Server)
```
gst-launch-1.0 autovideosrc ! videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! jpegenc ! rtpjpegpay ! rtpstreampay ! tcpserversink host=0.0.0.0 port=ポート番号
```
バインドするIPにはSota自身のIPアドレスを指定する。

### PC (Client)
```
gst-launch-1.0 -v tcpclientsrc host=ServerのIPアドレス port=ポート番号 ! application/x-rtp-stream,encoding-name=JPEG,payload=26 ! rtpstreamdepay ! rtpjpegdepay ! jpegdec ! videoconvert ! autovideosink
```

## UDP version
### Sota (Sender)
```
gst-launch-1.0 -v autovideosrc !  videoconvert ! videoscale ! video/x-raw,width=320,height=240 ! jpegenc ! rtpjpegpay ! udpsink host=送信先のIPアドレス port=ポート番号
```

### PC (Receiver)
```
gst-launch-1.0 -v udpsrc port=ポート番号 caps = "application/x-rtp,encoding-name=JPEG,payload=26" ! rtpjpegdepay ! jpegdec ! videoconvert ! autovideosink
```

