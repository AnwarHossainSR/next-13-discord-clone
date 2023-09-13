'use client';

import { useContext, useEffect, useMemo, useState } from 'react';
import { io as ClientIO } from 'socket.io-client';

import type { ChildrenProps } from '@/types';

import { SocketContext } from './SocketContext';

export type SocketContextType = {
  socket: any | null;
  isConnected: boolean;
};

export const useSocket = () => {
  return useContext(SocketContext);
};

export const SocketProvider = ({ children }: ChildrenProps) => {
  const [socket, setSocket] = useState(null);
  const [isConnected, setIsConnected] = useState(false);

  useEffect(() => {
    const socketInstance = new (ClientIO as any)(
      process.env.NEXT_PUBLIC_SITE_URL!,
      {
        path: '/api/socket/io',
        addTrailingSlash: false,
      }
    );

    socketInstance.on('connect', () => {
      setIsConnected(true);
    });

    socketInstance.on('disconnect', () => {
      setIsConnected(false);
    });

    setSocket(socketInstance);

    return () => {
      socketInstance.disconnect();
    };
  }, []);

  // Wrap the value in useMemo to prevent it from changing on every render
  const contextValue = useMemo(
    () => ({ socket, isConnected }),
    [socket, isConnected]
  );

  return (
    <SocketContext.Provider value={contextValue}>
      {children}
    </SocketContext.Provider>
  );
};
