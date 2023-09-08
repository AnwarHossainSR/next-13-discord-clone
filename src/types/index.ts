import type { Server as NetServer, Socket } from 'net';

import type { Member, Profile, Server } from '@prisma/client';
import type { NextApiResponse, NextPage } from 'next';
import type { AppProps } from 'next/app';
import type { ReactNode } from 'react';
import type { Server as SocketIOServer } from 'socket.io';

export type NextPageWithLayout = NextPage & {
  getLayout?: () => ReactNode;
};

export type AppPropsWithLayout = AppProps & {
  Component: NextPageWithLayout;
};

export type ChildrenProps = {
  children: ReactNode;
};

export type ServerWithMembersWithProfiles = Server & {
  members: (Member & { profile: Profile })[];
};

export type NextApiResponseServerIo = NextApiResponse & {
  socket: Socket & {
    server: NetServer & {
      io: SocketIOServer;
    };
  };
};
