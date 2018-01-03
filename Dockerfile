FROM ubuntu:14.04.5

MAINTAINER Alex Leith <alex@auspatious.com>

# Install some core software
RUN apt-get update && apt-get install -y wget g++ make

# Set up the components needed for format support for cdo
RUN apt-get update && apt-get install -y nco netcdf-bin libhdf5-dev zlib1g-dev libjasper-dev libnetcdf-dev libgrib-api-dev


# Install cdo from source, so that we get other format support
WORKDIR /tmp
RUN wget https://code.mpimet.mpg.de/attachments/download/16035/cdo-1.9.2.tar.gz
RUN tar -xzvf cdo-1.9.2.tar.gz
WORKDIR /tmp/cdo-1.9.2
RUN ./configure --enable-netcdf4 --enable-zlib --with-netcdf=/usr/ --with-hdf5=/usr/ --with-grib_api=/usr/
RUN make
RUN make install

# Clean up
RUN rm -rf /tmp/*

CMD cdo
